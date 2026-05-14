import 'package:gestao_velas/src/core/connectivity/connectivity_service.dart';
import 'package:gestao_velas/src/core/error/exceptions.dart';
import 'package:gestao_velas/src/core/error/failures.dart';
import 'package:gestao_velas/src/feature/customers/data/models/customer_model.dart';
import 'package:gestao_velas/src/feature/customers/domain/datasources/customer_local_datasource.dart';
import 'package:gestao_velas/src/feature/customers/domain/datasources/customer_remote_datasource.dart';
import 'package:gestao_velas/src/feature/customers/domain/entities/customer_entity.dart';
import 'package:gestao_velas/src/feature/customers/domain/repositories/customer_repository.dart';
import 'package:dartz/dartz.dart';

class CustomerRepositoryImpl implements CustomerRepository {
  final CustomerLocalDatasource local;
  final CustomerRemoteDatasource remote;

  const CustomerRepositoryImpl({required this.local, required this.remote});

  @override
  Stream<List<CustomerEntity>> watchAll() async* {
    // 1. Emite dados locais imediatamente (offline-first)
    try {
      final localModels = await local.getAll();
      yield localModels.map((m) => m.toEntity()).toList();
    } on CacheException {
      yield [];
    }

    if (!await ConnectivityService.isOnline()) return;

    // 2. Stream do Firestore — merge respeitando registros pendentes locais
    try {
      await for (final remoteModels in remote.watchAll()) {
        final localModels = await local.getAll();
        final localById = {for (final m in localModels) m.id: m};
        final remoteIds = remoteModels.map((m) => m.id).toSet();

        // Upsert remote → local, sem sobrescrever pendentes
        for (final model in remoteModels) {
          final localVersion = localById[model.id];
          if (localVersion == null || !localVersion.pendingSync) {
            await local.save(model);
          }
        }

        // Monta lista final: preferência ao local pendente; inclui criações offline
        final result = <CustomerModel>[];
        for (final model in remoteModels) {
          final localVersion = localById[model.id];
          result.add(
            (localVersion != null && localVersion.pendingSync)
                ? localVersion
                : model,
          );
        }
        for (final model in localModels) {
          if (!remoteIds.contains(model.id) && model.pendingSync) {
            result.add(model);
          }
        }

        yield result.map((m) => m.toEntity()).toList();
      }
    } catch (_) {}
  }

  @override
  Future<Either<Failure, List<CustomerEntity>>> getAll() async {
    try {
      final models = await local.getAll();
      return Right(models.map((m) => m.toEntity()).toList());
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, CustomerEntity?>> getById(String id) async {
    try {
      final model = await local.getById(id);
      return Right(model?.toEntity());
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> save(CustomerEntity entity) async {
    try {
      final model = CustomerModel.fromEntity(entity, pendingSync: true);
      await local.save(model);
      if (await ConnectivityService.isOnline()) {
        await remote.save(model);
        await local.save(model.copyWith(pendingSync: false));
      }
      return const Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } on ServerException {
      return const Right(null);
    }
  }

  @override
  Future<Either<Failure, void>> update(CustomerEntity entity) async {
    try {
      final model = CustomerModel.fromEntity(entity, pendingSync: true);
      await local.update(model);
      if (await ConnectivityService.isOnline()) {
        await remote.update(model);
        await local.save(model.copyWith(pendingSync: false));
      }
      return const Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } on ServerException {
      return const Right(null);
    }
  }

  @override
  Future<Either<Failure, void>> delete(String id) async {
    try {
      await local.delete(id);
      if (await ConnectivityService.isOnline()) {
        await remote.delete(id);
      }
      return const Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } on ServerException {
      return const Right(null);
    }
  }

  @override
  Future<bool> syncFromRemote() async {
    if (!await ConnectivityService.isOnline()) return false;
    try {
      bool changed = false;
      final localModels = await local.getAll();
      final localById = {for (final m in localModels) m.id: m};

      // 1. Empurra registros pendentes ao remote e marca como sincronizados
      for (final model in localModels.where((m) => m.pendingSync)) {
        await remote.save(model); // set() = upsert no Firestore
        await local.save(model.copyWith(pendingSync: false));
        changed = true;
      }

      // 2. Puxa remote → local (novos registros de outros dispositivos)
      final remoteModels = await remote.getAll();
      for (final model in remoteModels) {
        final localVersion = localById[model.id];
        if (localVersion == null || !localVersion.pendingSync) {
          await local.save(model);
          if (localVersion == null) changed = true;
        }
      }

      return changed;
    } catch (_) {
      return false;
    }
  }
}
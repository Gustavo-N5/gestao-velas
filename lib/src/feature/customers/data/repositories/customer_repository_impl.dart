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

    // 2. Stream do Firestore — atualiza cache local a cada emissão
    if (!await ConnectivityService.isOnline()) return;

    try {
      await for (final models in remote.watchAll()) {
        for (final model in models) {
          await local.save(model);
        }
        yield models.map((m) => m.toEntity()).toList();
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
      final model = CustomerModel.fromEntity(entity);
      await local.save(model);
      if (await ConnectivityService.isOnline()) {
        await remote.save(model);
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
      final model = CustomerModel.fromEntity(entity);
      await local.update(model);
      if (await ConnectivityService.isOnline()) {
        await remote.update(model);
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
      final remoteModels = await remote.getAll();
      final localModels = await local.getAll();
      final localIds = localModels.map((m) => m.id).toSet();
      final remoteIds = remoteModels.map((m) => m.id).toSet();

      // Upsert remote → local
      for (final model in remoteModels) {
        await local.save(model);
      }

      // Push local-only records → remote (criados offline)
      for (final model in localModels) {
        if (!remoteIds.contains(model.id)) {
          await remote.save(model);
        }
      }

      return remoteModels.length != localIds.length ||
          remoteIds.any((id) => !localIds.contains(id));
    } catch (_) {
      return false;
    }
  }
}

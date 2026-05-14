import 'package:gestao_velas/src/core/connectivity/connectivity_service.dart';
import 'package:gestao_velas/src/core/error/exceptions.dart';
import 'package:gestao_velas/src/core/error/failures.dart';
import 'package:gestao_velas/src/feature/order/data/models/order_model.dart';
import 'package:gestao_velas/src/feature/order/domain/datasources/order_local_datasource.dart';
import 'package:gestao_velas/src/feature/order/domain/datasources/order_remote_datasource.dart';
import 'package:gestao_velas/src/feature/order/domain/entities/order_entity.dart';
import 'package:gestao_velas/src/feature/order/domain/repositories/order_repository.dart';
import 'package:dartz/dartz.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderLocalDatasource local;
  final OrderRemoteDatasource remote;

  OrderRepositoryImpl({required this.local, required this.remote});

  @override
  Stream<List<OrderEntity>> watchAll() async* {
    try {
      final localModels = await local.getAll();
      yield localModels.map((m) => m.toEntity()).toList();
    } on CacheException {
      yield [];
    }

    if (!await ConnectivityService.isOnline()) return;

    try {
      await for (final remoteModels in remote.watchAll()) {
        final localModels = await local.getAll();
        final localById = {for (final m in localModels) m.id: m};
        final remoteIds = remoteModels.map((m) => m.id).toSet();

        for (final model in remoteModels) {
          final localVersion = localById[model.id];
          if (localVersion == null || !localVersion.pendingSync) {
            await local.save(model);
          }
        }

        final result = <OrderModel>[];
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
  Future<Either<Failure, List<OrderEntity>>> getAll() async {
    try {
      final models = await local.getAll();
      return Right(models.map((m) => m.toEntity()).toList());
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, OrderEntity?>> getById(String id) async {
    try {
      final model = await local.getById(id);
      return Right(model?.toEntity());
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> save(OrderEntity entity) async {
    try {
      final model = OrderModel.fromEntity(entity, pendingSync: true);
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
  Future<Either<Failure, void>> update(OrderEntity entity) async {
    try {
      final model = OrderModel.fromEntity(entity, pendingSync: true);
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

      for (final model in localModels.where((m) => m.pendingSync)) {
        await remote.save(model);
        await local.save(model.copyWith(pendingSync: false));
        changed = true;
      }

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
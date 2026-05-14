import 'package:gestao_velas/src/feature/products/domain/datasources/product_remote_datasource.dart';
import 'package:gestao_velas/src/feature/products/domain/datasources/product_datasource.dart';
import 'package:gestao_velas/src/feature/products/domain/repositories/product_repository.dart';
import 'package:gestao_velas/src/feature/products/domain/entities/product_entity.dart';
import 'package:gestao_velas/src/feature/products/data/models/product_model.dart';
import 'package:gestao_velas/src/core/connectivity/connectivity_service.dart';
import 'package:gestao_velas/src/core/error/exceptions.dart';
import 'package:gestao_velas/src/core/error/failures.dart';
import 'package:dartz/dartz.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductDatasource local;
  final ProductRemoteDatasource remote;

  ProductRepositoryImpl({required this.local, required this.remote});

  @override
  Stream<List<ProductEntity>> watchAll() async* {
    try {
      final localModels = await local.getAll();
      yield localModels.map((m) => m.toEntity()).toList();
    } on CacheException {
      yield [];
    }

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
  Future<Either<Failure, List<ProductEntity>>> getAll() async {
    try {
      final models = await local.getAll();
      return Right(models.map((m) => m.toEntity()).toList());
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, ProductEntity?>> getById(String id) async {
    try {
      final model = await local.getById(id);
      return Right(model?.toEntity());
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> save(ProductEntity entity) async {
    try {
      final model = ProductModel.fromEntity(entity);
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
  Future<Either<Failure, void>> update(ProductEntity entity) async {
    try {
      final model = ProductModel.fromEntity(entity);
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

      for (final model in remoteModels) {
        await local.save(model);
      }

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

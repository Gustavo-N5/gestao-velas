import 'package:gestao_velas/src/feature/products/domain/repositories/product_repositorie.dart';
import 'package:gestao_velas/src/feature/products/domain/datasorces/product_datasorce.dart';
import 'package:gestao_velas/src/feature/products/domain/entities/product_entity.dart';
import 'package:gestao_velas/src/feature/products/data/models/product_model.dart';
import 'package:gestao_velas/src/core/error/exceptions.dart';
import 'package:gestao_velas/src/core/error/failures.dart';
import 'package:dartz/dartz.dart';

class ProductRepositorieImpl implements ProductRepositorie {
  final ProductDatasorce datasource;

  ProductRepositorieImpl({required this.datasource});
  @override
  Future<Either<Failure, List<ProductEntity>>> getAll() async {
    try {
      final models = await datasource.getAll();
      return Right(models.map((m) => m.toEntity()).toList());
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, ProductEntity?>> getById(String id) async {
    try {
      final model = await datasource.getById(id);
      return Right(model?.toEntity());
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> save(ProductEntity entity) async {
    try {
      await datasource.save(ProductModel.fromEntity(entity));
      return const Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> delete(String id) async {
    try {
      await datasource.delete(id);
      return const Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> update(ProductEntity entity) async {
    try {
      await datasource.update(ProductModel.fromEntity(entity));
      return const Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    }
  }
}

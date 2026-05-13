import 'package:gestao_velas/src/feature/products/domain/entities/product_entity.dart';
import 'package:gestao_velas/src/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<ProductEntity>>> getAll();
  Future<Either<Failure, ProductEntity?>> getById(String id);
  Future<Either<Failure, void>> save(ProductEntity entity);
  Future<Either<Failure, void>> delete(String id);
  Future<Either<Failure, void>> update(ProductEntity entity);
}

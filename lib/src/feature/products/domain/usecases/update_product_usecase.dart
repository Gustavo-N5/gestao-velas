import 'package:gestao_velas/src/feature/products/domain/repositories/product_repository.dart';
import 'package:gestao_velas/src/feature/products/domain/entities/product_entity.dart';
import 'package:gestao_velas/src/core/error/failures.dart';
import 'package:dartz/dartz.dart';

class UpdateProductUseCase {
  final ProductRepository repository;
  const UpdateProductUseCase(this.repository);

  Future<Either<Failure, void>> call(ProductEntity entity) {
    return repository.update(entity);
  }
}

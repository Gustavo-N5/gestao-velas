import 'package:gestao_velas/src/feature/products/domain/repositories/product_repository.dart';
import 'package:gestao_velas/src/feature/products/domain/entities/product_entity.dart';
import 'package:gestao_velas/src/core/error/failures.dart';
import 'package:dartz/dartz.dart';

class SaveProductUseCase {
  final ProductRepository repository;
  const SaveProductUseCase(this.repository);

  Future<Either<Failure, void>> call(ProductEntity entity) {
    return repository.save(entity);
  }
}

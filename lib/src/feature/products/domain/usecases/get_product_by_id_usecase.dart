import 'package:gestao_velas/src/feature/products/domain/repositories/product_repository.dart';
import 'package:gestao_velas/src/feature/products/domain/entities/product_entity.dart';
import 'package:gestao_velas/src/core/error/failures.dart';
import 'package:dartz/dartz.dart';

class GetProductByIdUseCase {
  final ProductRepository repository;
  const GetProductByIdUseCase(this.repository);

  Future<Either<Failure, ProductEntity?>> call(String id) {
    return repository.getById(id);
  }
}

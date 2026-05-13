import 'package:gestao_velas/src/feature/products/domain/repositories/product_repository.dart';
import 'package:gestao_velas/src/core/error/failures.dart';
import 'package:dartz/dartz.dart';

class DeleteProductUseCase {
  final ProductRepository repository;
  const DeleteProductUseCase(this.repository);

  Future<Either<Failure, void>> call(String id) {
    return repository.delete(id);
  }
}

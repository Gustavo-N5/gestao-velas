import 'package:gestao_velas/src/feature/order/domain/repositories/order_repository.dart';
import 'package:gestao_velas/src/core/error/failures.dart';
import 'package:dartz/dartz.dart';

class DeleteOrderUseCase {
  final OrderRepository repository;
  const DeleteOrderUseCase(this.repository);

  Future<Either<Failure, void>> call(String id) {
    return repository.delete(id);
  }
}

import 'package:gestao_velas/src/feature/order/domain/repositories/order_repository.dart';
import 'package:gestao_velas/src/feature/order/domain/entities/order_entity.dart';
import 'package:gestao_velas/src/core/error/failures.dart';
import 'package:dartz/dartz.dart';

class UpdatePaymentStatusUseCase {
  final OrderRepository repository;
  const UpdatePaymentStatusUseCase(this.repository);

  Future<Either<Failure, void>> call(OrderEntity entity) {
    return repository.update(entity);
  }
}

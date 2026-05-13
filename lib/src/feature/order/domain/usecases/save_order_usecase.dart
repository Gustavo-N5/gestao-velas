import 'package:gestao_velas/src/feature/order/domain/repositories/order_repository.dart';
import 'package:gestao_velas/src/feature/order/domain/entities/order_entity.dart';
import 'package:gestao_velas/src/core/error/failures.dart';
import 'package:dartz/dartz.dart';

class SaveOrderUseCase {
  final OrderRepository repository;
  const SaveOrderUseCase(this.repository);

  Future<Either<Failure, void>> call(OrderEntity entity) {
    return repository.save(entity);
  }
}

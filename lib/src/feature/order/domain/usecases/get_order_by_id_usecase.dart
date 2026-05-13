import 'package:gestao_velas/src/feature/order/domain/repositories/order_repository.dart';
import 'package:gestao_velas/src/feature/order/domain/entities/order_entity.dart';
import 'package:gestao_velas/src/core/error/failures.dart';
import 'package:dartz/dartz.dart';

class GetOrderByIdUseCase {
  final OrderRepository repository;
  const GetOrderByIdUseCase(this.repository);

  Future<Either<Failure, OrderEntity?>> call(String id) {
    return repository.getById(id);
  }
}

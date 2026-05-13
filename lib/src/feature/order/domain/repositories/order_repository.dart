import 'package:gestao_velas/src/feature/order/domain/entities/order_entity.dart';
import 'package:gestao_velas/src/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class OrderRepository {
  Future<Either<Failure, List<OrderEntity>>> getAll();
  Future<Either<Failure, OrderEntity?>> getById(String id);
  Future<Either<Failure, void>> save(OrderEntity entity);
  Future<Either<Failure, void>> delete(String id);
  Future<Either<Failure, void>> update(OrderEntity entity);
}

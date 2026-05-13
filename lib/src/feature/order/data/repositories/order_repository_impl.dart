import 'package:gestao_velas/src/feature/order/domain/repositories/order_repository.dart';
import 'package:gestao_velas/src/feature/order/domain/datasources/order_local_datasource.dart';
import 'package:gestao_velas/src/feature/order/domain/entities/order_entity.dart';
import 'package:gestao_velas/src/feature/order/data/models/order_model.dart';
import 'package:gestao_velas/src/core/error/exceptions.dart';
import 'package:gestao_velas/src/core/error/failures.dart';
import 'package:dartz/dartz.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderLocalDatasource datasource;

  OrderRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, List<OrderEntity>>> getAll() async {
    try {
      final models = await datasource.getAll();
      return Right(models.map((m) => m.toEntity()).toList());
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, OrderEntity?>> getById(String id) async {
    try {
      final model = await datasource.getById(id);
      return Right(model?.toEntity());
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> save(OrderEntity entity) async {
    try {
      await datasource.save(OrderModel.fromEntity(entity));
      return const Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> delete(String id) async {
    try {
      await datasource.delete(id);
      return const Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> update(OrderEntity entity) async {
    try {
      await datasource.update(OrderModel.fromEntity(entity));
      return const Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    }
  }
}

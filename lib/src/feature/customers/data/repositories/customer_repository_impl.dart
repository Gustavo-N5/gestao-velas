import 'package:gestao_velas/src/feature/customers/domain/datasources/customer_local_datasource.dart';
import 'package:gestao_velas/src/feature/customers/domain/repositories/customer_repository.dart';
import 'package:gestao_velas/src/feature/customers/domain/entities/customer_entity.dart';
import 'package:gestao_velas/src/feature/customers/data/models/customer_model.dart';
import 'package:gestao_velas/src/core/error/exceptions.dart';
import 'package:gestao_velas/src/core/error/failures.dart';
import 'package:dartz/dartz.dart';

class CustomerRepositoryImpl implements CustomerRepository {
  final CustomerLocalDatasource datasource;

  const CustomerRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, List<CustomerEntity>>> getAll() async {
    try {
      final models = await datasource.getAll();
      return Right(models.map((m) => m.toEntity()).toList());
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, CustomerEntity?>> getById(String id) async {
    try {
      final model = await datasource.getById(id);
      return Right(model?.toEntity());
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> save(CustomerEntity entity) async {
    try {
      await datasource.save(CustomerModel.fromEntity(entity));
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
  Future<Either<Failure, void>> update(CustomerEntity entity) async {
    try {
      await datasource.update(CustomerModel.fromEntity(entity));
      return const Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    }
  }
}

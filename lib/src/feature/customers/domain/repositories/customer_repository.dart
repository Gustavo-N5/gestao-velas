import 'package:gestao_velas/src/feature/customers/domain/entities/customer_entity.dart';
import 'package:gestao_velas/src/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class CustomerRepository {
  Stream<List<CustomerEntity>> watchAll();
  Future<Either<Failure, List<CustomerEntity>>> getAll();
  Future<Either<Failure, CustomerEntity?>> getById(String id);
  Future<Either<Failure, void>> save(CustomerEntity entity);
  Future<Either<Failure, void>> delete(String id);
  Future<Either<Failure, void>> update(CustomerEntity entity);
  Future<bool> syncFromRemote();
}

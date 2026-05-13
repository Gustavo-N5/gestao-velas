import 'package:gestao_velas/src/feature/customers/domain/repositories/customer_repository.dart';
import 'package:gestao_velas/src/feature/customers/domain/entities/customer_entity.dart';
import 'package:gestao_velas/src/core/error/failures.dart';
import 'package:dartz/dartz.dart';

class GetCustomerByIdUseCase {
  final CustomerRepository repository;
  const GetCustomerByIdUseCase(this.repository);

  Future<Either<Failure, CustomerEntity?>> call(String id) {
    return repository.getById(id);
  }
}

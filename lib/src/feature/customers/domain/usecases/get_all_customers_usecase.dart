import 'package:gestao_velas/src/feature/customers/domain/repositories/customer_repository.dart';
import 'package:gestao_velas/src/feature/customers/domain/entities/customer_entity.dart';
import 'package:gestao_velas/src/core/error/failures.dart';
import 'package:dartz/dartz.dart';

class GetAllCustomersUseCase {
  final CustomerRepository repository;
  const GetAllCustomersUseCase(this.repository);

  Future<Either<Failure, List<CustomerEntity>>> call() {
    return repository.getAll();
  }
}

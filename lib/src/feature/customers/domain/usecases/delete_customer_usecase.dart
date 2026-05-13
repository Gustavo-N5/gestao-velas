import 'package:gestao_velas/src/feature/customers/domain/repositories/customer_repository.dart';
import 'package:gestao_velas/src/core/error/failures.dart';
import 'package:dartz/dartz.dart';

class DeleteCustomerUseCase {
  final CustomerRepository repository;
  const DeleteCustomerUseCase(this.repository);

  Future<Either<Failure, void>> call(String id) {
    return repository.delete(id);
  }
}

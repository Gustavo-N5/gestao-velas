import 'package:gestao_velas/src/feature/customers/domain/repositories/customer_repository.dart';
import 'package:gestao_velas/src/feature/customers/domain/entities/customer_entity.dart';
import 'package:gestao_velas/src/core/error/failures.dart';
import 'package:dartz/dartz.dart';

class SaveCustomerUseCase {
  final CustomerRepository repository;
  const SaveCustomerUseCase(this.repository);

  Future<Either<Failure, void>> call(CustomerEntity entity) {
    return repository.save(entity);
  }
}

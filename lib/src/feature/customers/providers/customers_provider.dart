import 'package:gestao_velas/src/feature/customers/data/datasources/customer_local_datasource_impl.dart';
import 'package:gestao_velas/src/feature/customers/data/datasources/customer_remote_datasource_impl.dart';
import 'package:gestao_velas/src/feature/customers/data/repositories/customer_repository_impl.dart';
import 'package:gestao_velas/src/feature/customers/domain/entities/customer_entity.dart';
import 'package:gestao_velas/src/feature/customers/domain/repositories/customer_repository.dart';
import 'package:gestao_velas/src/feature/customers/domain/usecases/delete_customer_usecase.dart';
import 'package:gestao_velas/src/feature/customers/domain/usecases/save_customer_usecase.dart';
import 'package:gestao_velas/src/feature/customers/domain/usecases/update_customer_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'customers_provider.g.dart';

@riverpod
CustomerRepository customerRepository(Ref ref) {
  return CustomerRepositoryImpl(
    local: CustomerLocalDatasourceImpl(),
    remote: CustomerRemoteDatasourceImpl(),
  );
}

@riverpod
class CustomersNotifier extends _$CustomersNotifier {
  @override
  Stream<List<CustomerEntity>> build() {
    return ref.watch(customerRepositoryProvider).watchAll();
  }

  Future<void> save(CustomerEntity entity) async {
    final result = await SaveCustomerUseCase(
      ref.read(customerRepositoryProvider),
    )(entity);
    result.fold((f) => throw f, (_) => ref.invalidateSelf());
  }

  Future<void> updateCustomer(CustomerEntity entity) async {
    final result = await UpdateCustomerUseCase(
      ref.read(customerRepositoryProvider),
    )(entity);
    result.fold((f) => throw f, (_) => ref.invalidateSelf());
  }

  Future<void> delete(String id) async {
    final result = await DeleteCustomerUseCase(
      ref.read(customerRepositoryProvider),
    )(id);
    result.fold((f) => throw f, (_) => ref.invalidateSelf());
  }
}

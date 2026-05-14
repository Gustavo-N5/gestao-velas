import 'package:gestao_velas/src/feature/customers/data/models/customer_model.dart';

abstract class CustomerRemoteDatasource {
  Stream<List<CustomerModel>> watchAll();
  Future<List<CustomerModel>> getAll();
  Future<CustomerModel?> getById(String id);
  Future<void> save(CustomerModel model);
  Future<void> update(CustomerModel model);
  Future<void> delete(String id);
}

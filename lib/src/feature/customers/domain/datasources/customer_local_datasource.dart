import 'package:gestao_velas/src/feature/customers/data/models/customer_model.dart';

abstract class CustomerLocalDatasource {
  Future<List<CustomerModel>> getAll();
  Future<CustomerModel?> getById(String id);
  Future<void> save(CustomerModel model);
  Future<void> delete(String id);
}

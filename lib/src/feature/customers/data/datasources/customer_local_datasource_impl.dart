import 'package:gestao_velas/src/feature/customers/domain/datasources/customer_local_datasource.dart';
import 'package:gestao_velas/src/feature/customers/data/models/customer_model.dart';
import 'package:gestao_velas/src/core/database/hive_database.dart';
import 'package:gestao_velas/src/core/database/hive_boxes.dart';
import 'package:gestao_velas/src/core/error/exceptions.dart';
import 'package:hive/hive.dart';

class CustomerLocalDatasourceImpl implements CustomerLocalDatasource {
  Future<Box<CustomerModel>> get _box =>
      HiveDatabase.openBox<CustomerModel>(HiveBoxes.customers);

  @override
  Future<List<CustomerModel>> getAll() async {
    try {
      final box = await _box;
      return box.values.toList();
    } catch (e) {
      throw CacheException('Erro ao buscar clientes: $e');
    }
  }

  @override
  Future<CustomerModel?> getById(String id) async {
    try {
      final box = await _box;
      return box.get(id);
    } catch (e) {
      throw CacheException('Erro ao buscar cliente: $e');
    }
  }

  @override
  Future<void> save(CustomerModel model) async {
    try {
      final box = await _box;
      await box.put(model.id, model);
    } catch (e) {
      throw CacheException('Erro ao salvar cliente: $e');
    }
  }

  @override
  Future<void> delete(String id) async {
    try {
      final box = await _box;
      await box.delete(id);
    } catch (e) {
      throw CacheException('Erro ao deletar cliente: $e');
    }
  }
}

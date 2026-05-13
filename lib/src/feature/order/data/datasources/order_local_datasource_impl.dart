import 'package:gestao_velas/src/feature/order/domain/datasources/order_local_datasource.dart';
import 'package:gestao_velas/src/feature/order/data/models/order_model.dart';
import 'package:gestao_velas/src/core/database/hive_database.dart';
import 'package:gestao_velas/src/core/database/hive_boxes.dart';
import 'package:gestao_velas/src/core/error/exceptions.dart';
import 'package:hive/hive.dart';

class OrderLocalDatasourceImpl implements OrderLocalDatasource {
  Future<Box<OrderModel>> get _box =>
      HiveDatabase.openBox<OrderModel>(HiveBoxes.orders);

  @override
  Future<List<OrderModel>> getAll() async {
    try {
      final box = await _box;
      return box.values.toList();
    } catch (e) {
      throw CacheException('Erro ao buscar pedidos: $e');
    }
  }

  @override
  Future<OrderModel?> getById(String id) async {
    try {
      final box = await _box;
      return box.get(id);
    } catch (e) {
      throw CacheException('Erro ao buscar pedido: $e');
    }
  }

  @override
  Future<void> save(OrderModel model) async {
    try {
      final box = await _box;
      await box.put(model.id, model);
    } catch (e) {
      throw CacheException('Erro ao salvar pedido: $e');
    }
  }

  @override
  Future<void> delete(String id) async {
    try {
      final box = await _box;
      await box.delete(id);
    } catch (e) {
      throw CacheException('Erro ao deletar pedido: $e');
    }
  }

  @override
  Future<void> update(OrderModel model) async {
    try {
      final box = await _box;
      await box.put(model.id, model);
    } catch (e) {
      throw CacheException('Erro ao atualizar pedido: $e');
    }
  }
}

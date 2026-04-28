import 'package:gestao_velas/src/feature/order/domain/datasorces/order_local_datasorce.dart';
import 'package:gestao_velas/src/feature/order/data/models/order_model.dart';
import 'package:gestao_velas/src/core/database/hive_database.dart';
import 'package:gestao_velas/src/core/database/hive_boxes.dart';
import 'package:gestao_velas/src/core/error/exceptions.dart';
import 'package:hive/hive.dart';

class OrderLocalDatasorceImpl implements OrderLocalDatasorce {
  Future<Box<OrderModel>> get _box =>
      HiveDatabase.openBox<OrderModel>(HiveBoxes.orders);

  @override
  Future<List<OrderModel>> getAll() async {
    try {
      final box = await _box;
      return box.values.toList();
    } catch (e) {
      throw CacheException('Erro ao buscar clientes: $e');
    }
  }

  @override
  Future<OrderModel?> getById(String id) async {
    try {
      final box = await _box;
      return box.get(id);
    } catch (e) {
      throw CacheException('Erro ao buscar cliente: $e');
    }
  }

  @override
  Future<void> save(OrderModel model) async {
    try {
      final box = await _box;
      await box.put(model.id, model);
    } catch (e) {
      throw CacheException('Erro ao salvar cliente: $e');
    }
  }

  @override
  Future<void> delete(OrderModel model) async {
    try {
      final box = await _box;
      await box.delete(model.id);
    } catch (e) {
      throw CacheException('Erro ao deletar pedido: $e');
    }
  }
}

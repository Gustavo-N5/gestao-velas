import 'package:gestao_velas/src/feature/order/data/models/order_model.dart';

abstract class OrderLocalDatasorce {
  Future<List<OrderModel>> getAll();
  Future<OrderModel?> getById(String id);
  Future<void> save(OrderModel model);
  Future<void> delete(String id);
}

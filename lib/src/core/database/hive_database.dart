import 'package:gestao_velas/src/feature/customers/data/models/customer_model.g.dart';
import 'package:gestao_velas/src/feature/order/data/models/order_item_model.g.dart';
import 'package:gestao_velas/src/feature/products/data/models/product_model.g.dart';
import 'package:gestao_velas/src/feature/order/data/models/order_model.g.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveDatabase {
  static Future<void> init() async {
    await Hive.initFlutter();
    _registerAdapters();
  }

  static void _registerAdapters() {
    Hive.registerAdapter(CustomerModelAdapter());
    Hive.registerAdapter(ProductModelAdapter());
    Hive.registerAdapter(OrderItemModelAdapter());
    Hive.registerAdapter(OrderModelAdapter());
  }

  static Future<Box<T>> openBox<T>(String name) async {
    if (Hive.isBoxOpen(name)) return Hive.box<T>(name);
    return await Hive.openBox<T>(name);
  }
}

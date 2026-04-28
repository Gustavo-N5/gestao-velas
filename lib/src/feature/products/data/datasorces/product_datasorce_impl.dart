import 'package:gestao_velas/src/feature/products/domain/datasorces/product_datasorce.dart';
import 'package:gestao_velas/src/feature/products/data/models/product_model.dart';
import 'package:gestao_velas/src/core/database/hive_database.dart';
import 'package:gestao_velas/src/core/database/hive_boxes.dart';
import 'package:gestao_velas/src/core/error/exceptions.dart';
import 'package:hive/hive.dart';

class ProductDatasorceImpl implements ProductDatasorce {
  Future<Box<ProductModel>> get _box =>
      HiveDatabase.openBox<ProductModel>(HiveBoxes.products);

  @override
  Future<List<ProductModel>> getAll() async {
    try {
      final box = await _box;
      return box.values.toList();
    } catch (e) {
      throw CacheException('Erro ao buscar clientes: $e');
    }
  }

  @override
  Future<ProductModel?> getById(String id) async {
    try {
      final box = await _box;
      return box.get(id);
    } catch (e) {
      throw CacheException('Erro ao buscar cliente: $e');
    }
  }

  @override
  Future<void> save(ProductModel model) async {
    try {
      final box = await _box;
      await box.put(model.id, model);
    } catch (e) {
      throw CacheException('Erro ao salvar cliente: $e');
    }
  }

  @override
  Future<void> delete(ProductModel model) async {
    try {
      final box = await _box;
      await box.delete(model.id);
    } catch (e) {
      throw CacheException('Erro ao deletar pedido: $e');
    }
  }
}

import 'package:gestao_velas/src/feature/products/domain/datasources/product_datasource.dart';
import 'package:gestao_velas/src/feature/products/data/models/product_model.dart';
import 'package:gestao_velas/src/core/database/hive_database.dart';
import 'package:gestao_velas/src/core/database/hive_boxes.dart';
import 'package:gestao_velas/src/core/error/exceptions.dart';
import 'package:hive/hive.dart';

class ProductDatasourceImpl implements ProductDatasource {
  Future<Box<ProductModel>> get _box =>
      HiveDatabase.openBox<ProductModel>(HiveBoxes.products);

  @override
  Future<List<ProductModel>> getAll() async {
    try {
      final box = await _box;
      return box.values.toList();
    } catch (e) {
      throw CacheException('Erro ao buscar produtos: $e');
    }
  }

  @override
  Future<ProductModel?> getById(String id) async {
    try {
      final box = await _box;
      return box.get(id);
    } catch (e) {
      throw CacheException('Erro ao buscar produto: $e');
    }
  }

  @override
  Future<void> save(ProductModel model) async {
    try {
      final box = await _box;
      await box.put(model.id, model);
    } catch (e) {
      throw CacheException('Erro ao salvar produto: $e');
    }
  }

  @override
  Future<void> delete(String id) async {
    try {
      final box = await _box;
      await box.delete(id);
    } catch (e) {
      throw CacheException('Erro ao deletar produto: $e');
    }
  }

  @override
  Future<void> update(ProductModel model) async {
    try {
      final box = await _box;
      await box.put(model.id, model);
    } catch (e) {
      throw CacheException('Erro ao atualizar produto: $e');
    }
  }
}

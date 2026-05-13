import 'package:gestao_velas/src/feature/products/data/models/product_model.dart';

abstract class ProductDatasource {
  Future<List<ProductModel>> getAll();
  Future<ProductModel?> getById(String id);
  Future<void> save(ProductModel model);
  Future<void> delete(String id);
  Future<void> update(ProductModel model);
}

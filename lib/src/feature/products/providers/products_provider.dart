import 'package:gestao_velas/src/feature/products/data/datasources/product_datasource_impl.dart';
import 'package:gestao_velas/src/feature/products/data/datasources/product_remote_datasource_impl.dart';
import 'package:gestao_velas/src/feature/products/data/repositories/product_repository_impl.dart';
import 'package:gestao_velas/src/feature/products/domain/entities/product_entity.dart';
import 'package:gestao_velas/src/feature/products/domain/repositories/product_repository.dart';
import 'package:gestao_velas/src/feature/products/domain/usecases/delete_product_usecase.dart';
import 'package:gestao_velas/src/feature/products/domain/usecases/save_product_usecase.dart';
import 'package:gestao_velas/src/feature/products/domain/usecases/update_product_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'products_provider.g.dart';

@riverpod
ProductRepository productRepository(Ref ref) {
  return ProductRepositoryImpl(
    local: ProductDatasourceImpl(),
    remote: ProductRemoteDatasourceImpl(),
  );
}

@riverpod
class ProductsNotifier extends _$ProductsNotifier {
  @override
  Stream<List<ProductEntity>> build() {
    return ref.watch(productRepositoryProvider).watchAll();
  }

  Future<void> save(ProductEntity entity) async {
    final result = await SaveProductUseCase(
      ref.read(productRepositoryProvider),
    )(entity);
    result.fold((f) => throw f, (_) => ref.invalidateSelf());
  }

  Future<void> delete(String id) async {
    final result = await DeleteProductUseCase(
      ref.read(productRepositoryProvider),
    )(id);
    result.fold((f) => throw f, (_) => ref.invalidateSelf());
  }

  Future<void> updateProduct(ProductEntity entity) async {
    final result = await UpdateProductUseCase(
      ref.read(productRepositoryProvider),
    )(entity);
    result.fold((f) => throw f, (_) => ref.invalidateSelf());
  }
}

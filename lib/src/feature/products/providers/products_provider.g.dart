// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(productRepository)
final productRepositoryProvider = ProductRepositoryProvider._();

final class ProductRepositoryProvider
    extends
        $FunctionalProvider<
          ProductRepository,
          ProductRepository,
          ProductRepository
        >
    with $Provider<ProductRepository> {
  ProductRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'productRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$productRepositoryHash();

  @$internal
  @override
  $ProviderElement<ProductRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ProductRepository create(Ref ref) {
    return productRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProductRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProductRepository>(value),
    );
  }
}

String _$productRepositoryHash() => r'c00056162c84fd2416acf9ec0d45356dca891058';

@ProviderFor(ProductsNotifier)
final productsProvider = ProductsNotifierProvider._();

final class ProductsNotifierProvider
    extends $AsyncNotifierProvider<ProductsNotifier, List<ProductEntity>> {
  ProductsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'productsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$productsNotifierHash();

  @$internal
  @override
  ProductsNotifier create() => ProductsNotifier();
}

String _$productsNotifierHash() => r'59a3fa8faa76967be93216d22e8ea2398f2fc03d';

abstract class _$ProductsNotifier extends $AsyncNotifier<List<ProductEntity>> {
  FutureOr<List<ProductEntity>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<ProductEntity>>, List<ProductEntity>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<ProductEntity>>, List<ProductEntity>>,
              AsyncValue<List<ProductEntity>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

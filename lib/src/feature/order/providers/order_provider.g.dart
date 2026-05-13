// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(orderRepository)
final orderRepositoryProvider = OrderRepositoryProvider._();

final class OrderRepositoryProvider
    extends
        $FunctionalProvider<OrderRepository, OrderRepository, OrderRepository>
    with $Provider<OrderRepository> {
  OrderRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'orderRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$orderRepositoryHash();

  @$internal
  @override
  $ProviderElement<OrderRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  OrderRepository create(Ref ref) {
    return orderRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(OrderRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<OrderRepository>(value),
    );
  }
}

String _$orderRepositoryHash() => r'aeb43ac78d230d4ea050cbe971e3265cb147ce97';

@ProviderFor(OrdersNotifier)
final ordersProvider = OrdersNotifierProvider._();

final class OrdersNotifierProvider
    extends $AsyncNotifierProvider<OrdersNotifier, List<OrderEntity>> {
  OrdersNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ordersProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ordersNotifierHash();

  @$internal
  @override
  OrdersNotifier create() => OrdersNotifier();
}

String _$ordersNotifierHash() => r'a5a80d2b36c7096e68708fb892e496f479117e6d';

abstract class _$OrdersNotifier extends $AsyncNotifier<List<OrderEntity>> {
  FutureOr<List<OrderEntity>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<OrderEntity>>, List<OrderEntity>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<OrderEntity>>, List<OrderEntity>>,
              AsyncValue<List<OrderEntity>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

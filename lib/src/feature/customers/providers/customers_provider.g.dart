// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customers_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(customerRepository)
final customerRepositoryProvider = CustomerRepositoryProvider._();

final class CustomerRepositoryProvider
    extends
        $FunctionalProvider<
          CustomerRepository,
          CustomerRepository,
          CustomerRepository
        >
    with $Provider<CustomerRepository> {
  CustomerRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'customerRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$customerRepositoryHash();

  @$internal
  @override
  $ProviderElement<CustomerRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CustomerRepository create(Ref ref) {
    return customerRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CustomerRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CustomerRepository>(value),
    );
  }
}

String _$customerRepositoryHash() =>
    r'0e5c9f4535bd85584b7fbcba315b48ce71a3c9cd';

@ProviderFor(CustomersNotifier)
final customersProvider = CustomersNotifierProvider._();

final class CustomersNotifierProvider
    extends $StreamNotifierProvider<CustomersNotifier, List<CustomerEntity>> {
  CustomersNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'customersProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$customersNotifierHash();

  @$internal
  @override
  CustomersNotifier create() => CustomersNotifier();
}

String _$customersNotifierHash() => r'365ac12c9584a92ef4d14654d8b28ebab56d01da';

abstract class _$CustomersNotifier
    extends $StreamNotifier<List<CustomerEntity>> {
  Stream<List<CustomerEntity>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<List<CustomerEntity>>, List<CustomerEntity>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<CustomerEntity>>,
                List<CustomerEntity>
              >,
              AsyncValue<List<CustomerEntity>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

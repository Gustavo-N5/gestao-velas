import 'package:gestao_velas/src/feature/order/data/datasources/order_local_datasource_impl.dart';
import 'package:gestao_velas/src/feature/order/data/datasources/order_remote_datasource_impl.dart';
import 'package:gestao_velas/src/feature/order/data/repositories/order_repository_impl.dart';
import 'package:gestao_velas/src/feature/order/domain/entities/order_entity.dart';
import 'package:gestao_velas/src/feature/order/domain/repositories/order_repository.dart';
import 'package:gestao_velas/src/feature/order/domain/usecases/delete_order_usecase.dart';
import 'package:gestao_velas/src/feature/order/domain/usecases/get_order_by_id_usecase.dart';
import 'package:gestao_velas/src/feature/order/domain/usecases/save_order_usecase.dart';
import 'package:gestao_velas/src/feature/order/domain/usecases/update_order_status_usecase.dart';
import 'package:gestao_velas/src/feature/order/domain/usecases/update_order_usecase.dart';
import 'package:gestao_velas/src/feature/order/domain/usecases/update_payment_status_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'order_provider.g.dart';

@riverpod
OrderRepository orderRepository(Ref ref) {
  return OrderRepositoryImpl(
    local: OrderLocalDatasourceImpl(),
    remote: OrderRemoteDatasourceImpl(),
  );
}

@riverpod
class OrdersNotifier extends _$OrdersNotifier {
  @override
  Stream<List<OrderEntity>> build() {
    return ref.watch(orderRepositoryProvider).watchAll();
  }

  Future<void> save(OrderEntity entity) async {
    final result = await SaveOrderUseCase(
      ref.read(orderRepositoryProvider),
    )(entity);
    result.fold((f) => throw f, (_) => ref.invalidateSelf());
  }

  Future<void> updateOrder(OrderEntity entity) async {
    final result = await UpdateOrderUseCase(
      ref.read(orderRepositoryProvider),
    )(entity);
    result.fold((f) => throw f, (_) => ref.invalidateSelf());
  }

  Future<void> delete(String id) async {
    final result = await DeleteOrderUseCase(
      ref.read(orderRepositoryProvider),
    )(id);
    result.fold((f) => throw f, (_) => ref.invalidateSelf());
  }

  Future<void> updateOrderStatus(String id, OrderStatus status) async {
    final order = state.value?.firstWhere((o) => o.id == id);
    if (order == null) return;
    final result = await UpdateOrderStatusUseCase(
      ref.read(orderRepositoryProvider),
    )(order.copyWith(status: status));
    result.fold((f) => throw f, (_) => ref.invalidateSelf());
  }

  Future<void> updatePaymentStatus(String id, PaymentStatus paymentStatus) async {
    final order = state.value?.firstWhere((o) => o.id == id);
    if (order == null) return;
    final result = await UpdatePaymentStatusUseCase(
      ref.read(orderRepositoryProvider),
    )(order.copyWith(paymentStatus: paymentStatus));
    result.fold((f) => throw f, (_) => ref.invalidateSelf());
  }

  Future<OrderEntity> getById(String id) async {
    final result = await GetOrderByIdUseCase(
      ref.read(orderRepositoryProvider),
    )(id);
    return result.fold((f) => throw f, (order) => order!);
  }
}

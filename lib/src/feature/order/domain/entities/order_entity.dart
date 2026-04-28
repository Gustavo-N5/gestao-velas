import 'package:gestao_velas/src/feature/customers/domain/entities/customer_entity.dart';
import 'package:gestao_velas/src/feature/order/domain/entities/order_item_entity.dart';
import 'package:equatable/equatable.dart';

enum OrderStatus { approved, production, delivered, cancelled }

enum PaymentStatus { pending, partial, paid }

class OrderEntity extends Equatable {
  final String id;
  final CustomerEntity customer;
  final List<OrderItemEntity> items;
  final OrderStatus status;
  final PaymentStatus paymentStatus;
  final DateTime createdAt;
  final DateTime? deliveryDate;
  final String? notes;

  const OrderEntity({
    required this.id,
    required this.customer,
    required this.items,
    required this.status,
    required this.paymentStatus,
    required this.createdAt,
    this.deliveryDate,
    this.notes,
  });

  double get totalValue => items.fold(0, (sum, item) => sum + item.subtotal);

  @override
  List<Object?> get props => [
    id,
    customer,
    items,
    status,
    paymentStatus,
    createdAt,
    deliveryDate,
    notes,
  ];
}

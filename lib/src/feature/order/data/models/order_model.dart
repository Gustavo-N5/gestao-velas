import 'package:gestao_velas/src/feature/customers/domain/entities/customer_entity.dart';
import 'package:gestao_velas/src/feature/order/domain/entities/order_item_entity.dart';
import 'package:gestao_velas/src/feature/products/domain/entities/product_entity.dart';
import 'package:gestao_velas/src/feature/order/data/models/order_item_model.dart';
import 'package:gestao_velas/src/feature/order/domain/entities/order_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 3)
class OrderModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String customerId;

  @HiveField(2)
  final String customerName;

  @HiveField(3)
  final String customerPhone;

  @HiveField(4)
  final List<OrderItemModel> items;

  @HiveField(5)
  final int status;

  @HiveField(6)
  final int paymentStatus;

  @HiveField(7)
  final DateTime createdAt;

  @HiveField(8)
  final DateTime? deliveryDate;

  @HiveField(9)
  final String? notes;

  OrderModel({
    required this.id,
    required this.customerId,
    required this.customerName,
    required this.customerPhone,
    required this.items,
    required this.status,
    required this.paymentStatus,
    required this.createdAt,
    this.deliveryDate,
    this.notes,
  });

  factory OrderModel.fromEntity(OrderEntity entity) => OrderModel(
    id: entity.id,
    customerId: entity.customer.id,
    customerName: entity.customer.name,
    customerPhone: entity.customer.phone,
    items: entity.items
        .map(
          (i) => OrderItemModel(
            productId: i.product.id,
            productName: i.product.name,
            unitPrice: i.product.price,
            quantity: i.quantity,
          ),
        )
        .toList(),
    status: entity.status.index,
    paymentStatus: entity.paymentStatus.index,
    createdAt: entity.createdAt,
    deliveryDate: entity.deliveryDate,
    notes: entity.notes,
  );

  OrderEntity toEntity() => OrderEntity(
    id: id,
    customer: CustomerEntity(
      id: customerId,
      name: customerName,
      phone: customerPhone,
    ),
    items: items
        .map(
          (i) => OrderItemEntity(
            product: ProductEntity(
              id: i.productId,
              name: i.productName,
              price: i.unitPrice,
            ),
            quantity: i.quantity,
          ),
        )
        .toList(),
    status: OrderStatus.values[status],
    paymentStatus: PaymentStatus.values[paymentStatus],
    createdAt: createdAt,
    deliveryDate: deliveryDate,
    notes: notes,
  );
}

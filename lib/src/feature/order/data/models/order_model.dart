import 'package:cloud_firestore/cloud_firestore.dart';
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

  // Metadado local — true = alterado offline, ainda não sincronizado com Firestore
  // Não é armazenado no Firestore (ausente do toMap)
  @HiveField(10)
  final bool pendingSync;

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
    this.pendingSync = false,
  });

  factory OrderModel.fromEntity(
    OrderEntity entity, {
    bool pendingSync = true,
  }) => OrderModel(
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
    pendingSync: pendingSync,
  );

  OrderModel copyWith({bool? pendingSync}) => OrderModel(
    id: id,
    customerId: customerId,
    customerName: customerName,
    customerPhone: customerPhone,
    items: items,
    status: status,
    paymentStatus: paymentStatus,
    createdAt: createdAt,
    deliveryDate: deliveryDate,
    notes: notes,
    pendingSync: pendingSync ?? this.pendingSync,
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

  Map<String, dynamic> toMap() => {
    'id': id,
    'customerId': customerId,
    'customerName': customerName,
    'customerPhone': customerPhone,
    'items': items.map((i) => i.toMap()).toList(),
    'status': status,
    'paymentStatus': paymentStatus,
    'createdAt': Timestamp.fromDate(createdAt),
    'deliveryDate': deliveryDate != null ? Timestamp.fromDate(deliveryDate!) : null,
    'notes': notes,
    // pendingSync é metadado local — não vai para o Firestore
  };

  factory OrderModel.fromMap(Map<String, dynamic> map) => OrderModel(
    id: map['id'] as String,
    customerId: map['customerId'] as String,
    customerName: map['customerName'] as String,
    customerPhone: map['customerPhone'] as String,
    items: (map['items'] as List)
        .map((i) => OrderItemModel.fromMap(i as Map<String, dynamic>))
        .toList(),
    status: map['status'] as int,
    paymentStatus: map['paymentStatus'] as int,
    createdAt: (map['createdAt'] as Timestamp).toDate(),
    deliveryDate: (map['deliveryDate'] as Timestamp?)?.toDate(),
    notes: map['notes'] as String?,
    pendingSync: false, // vindo do Firestore = já sincronizado
  );
}
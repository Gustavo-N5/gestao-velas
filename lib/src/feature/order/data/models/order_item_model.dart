import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 2)
class OrderItemModel extends HiveObject {
  @HiveField(0)
  final String productId;

  @HiveField(1)
  final int quantity;

  @HiveField(2)
  final double unitPrice;

  @HiveField(3)
  final String productName;

  OrderItemModel({
    required this.productId,
    required this.quantity,
    required this.unitPrice,
    required this.productName,
  });

  Map<String, dynamic> toMap() => {
    'productId': productId,
    'productName': productName,
    'unitPrice': unitPrice,
    'quantity': quantity,
  };

  factory OrderItemModel.fromMap(Map<String, dynamic> map) => OrderItemModel(
    productId: map['productId'] as String,
    productName: map['productName'] as String,
    unitPrice: (map['unitPrice'] as num).toDouble(),
    quantity: map['quantity'] as int,
  );
}

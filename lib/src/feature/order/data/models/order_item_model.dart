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
}

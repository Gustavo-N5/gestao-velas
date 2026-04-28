import 'package:gestao_velas/src/feature/products/domain/entities/product_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 1)
class ProductModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final double price;

  @HiveField(3)
  final String? description;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    this.description,
  });

  factory ProductModel.fromEntity(ProductEntity entity) => ProductModel(
    id: entity.id,
    name: entity.name,
    price: entity.price,
    description: entity.description,
  );

  ProductEntity toEntity() =>
      ProductEntity(id: id, name: name, price: price, description: description);
}

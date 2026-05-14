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

  // Metadado local — true = alterado offline, ainda não sincronizado com Firestore
  // Não é armazenado no Firestore (ausente do toMap)
  @HiveField(4)
  final bool pendingSync;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    this.description,
    this.pendingSync = false,
  });

  factory ProductModel.fromEntity(
    ProductEntity entity, {
    bool pendingSync = true,
  }) => ProductModel(
    id: entity.id,
    name: entity.name,
    price: entity.price,
    description: entity.description,
    pendingSync: pendingSync,
  );

  ProductModel copyWith({bool? pendingSync}) => ProductModel(
    id: id,
    name: name,
    price: price,
    description: description,
    pendingSync: pendingSync ?? this.pendingSync,
  );

  ProductEntity toEntity() =>
      ProductEntity(id: id, name: name, price: price, description: description);

  Map<String, dynamic> toMap() => {
    'id': id,
    'name': name,
    'price': price,
    'description': description,
    // pendingSync é metadado local — não vai para o Firestore
  };

  factory ProductModel.fromMap(Map<String, dynamic> map) => ProductModel(
    id: map['id'] as String,
    name: map['name'] as String,
    price: (map['price'] as num).toDouble(),
    description: map['description'] as String?,
    pendingSync: false, // vindo do Firestore = já sincronizado
  );
}
import 'package:gestao_velas/src/feature/customers/domain/entities/customer_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 0)
class CustomerModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String phone;

  @HiveField(3)
  final String? street;

  @HiveField(4)
  final String? neighborhood;

  @HiveField(5)
  final String? city;

  CustomerModel({
    required this.id,
    required this.name,
    required this.phone,
    this.street,
    this.neighborhood,
    this.city,
  });

  factory CustomerModel.fromEntity(CustomerEntity entity) => CustomerModel(
    id: entity.id,
    name: entity.name,
    phone: entity.phone,
    street: entity.street,
    neighborhood: entity.neighborhood,
    city: entity.city,
  );

  CustomerEntity toEntity() => CustomerEntity(
    id: id,
    name: name,
    phone: phone,
    street: street,
    neighborhood: neighborhood,
    city: city,
  );
}

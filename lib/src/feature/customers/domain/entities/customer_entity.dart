import 'package:equatable/equatable.dart';

class CustomerEntity extends Equatable {
  final String id;
  final String name;
  final String phone;
  final String? street;
  final String? neighborhood;
  final String? city;

  const CustomerEntity({
    required this.id,
    required this.name,
    required this.phone,
    this.street,
    this.neighborhood,
    this.city,
  });

  @override
  List<Object?> get props => [id, name, phone, street, neighborhood, city];
}

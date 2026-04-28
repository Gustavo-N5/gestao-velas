import 'package:gestao_velas/src/feature/products/domain/entities/product_entity.dart';
import 'package:equatable/equatable.dart';

class OrderItemEntity extends Equatable {
  final ProductEntity product;
  final int quantity;

  const OrderItemEntity({required this.product, required this.quantity});

  double get subtotal => product.price * quantity;

  @override
  List<Object?> get props => [product, quantity];
}

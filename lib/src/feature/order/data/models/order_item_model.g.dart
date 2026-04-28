import 'package:hive/hive.dart';
import 'order_item_model.dart';

class OrderItemModelAdapter extends TypeAdapter<OrderItemModel> {
  @override
  final int typeId = 2;

  @override
  OrderItemModel read(BinaryReader reader) {
    return OrderItemModel(
      productId: reader.readString(),
      quantity: reader.readInt(),
      unitPrice: reader.readDouble(),
      productName: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, OrderItemModel obj) {
    writer.writeString(obj.productId);
    writer.writeInt(obj.quantity);
    writer.writeDouble(obj.unitPrice);
    writer.writeString(obj.productName);
  }
}

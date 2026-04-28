import 'package:hive/hive.dart';
import 'order_model.dart';
import 'order_item_model.dart';

class OrderModelAdapter extends TypeAdapter<OrderModel> {
  @override
  final int typeId = 3;

  @override
  OrderModel read(BinaryReader reader) {
    return OrderModel(
      id: reader.readString(),
      customerId: reader.readString(),
      customerName: reader.readString(),
      customerPhone: reader.readString(),
      items: (reader.readList()).cast<OrderItemModel>(),
      status: reader.readInt(),
      paymentStatus: reader.readInt(),
      createdAt: DateTime.fromMillisecondsSinceEpoch(reader.readInt()),
      deliveryDate: reader.readBool()
          ? DateTime.fromMillisecondsSinceEpoch(reader.readInt())
          : null,
      notes: reader.read() as String?,
    );
  }

  @override
  void write(BinaryWriter writer, OrderModel obj) {
    writer.writeString(obj.id);
    writer.writeString(obj.customerId);
    writer.writeString(obj.customerName);
    writer.writeString(obj.customerPhone);
    writer.writeList(obj.items);
    writer.writeInt(obj.status);
    writer.writeInt(obj.paymentStatus);
    writer.writeInt(obj.createdAt.millisecondsSinceEpoch);
    writer.writeBool(obj.deliveryDate != null);
    if (obj.deliveryDate != null) {
      writer.writeInt(obj.deliveryDate!.millisecondsSinceEpoch);
    }
    writer.write(obj.notes);
  }
}

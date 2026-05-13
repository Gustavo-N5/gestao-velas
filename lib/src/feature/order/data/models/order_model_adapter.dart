import 'package:hive/hive.dart';
import 'order_item_model.dart';
import 'order_model.dart';

class OrderModelAdapter extends TypeAdapter<OrderModel> {
  @override
  final int typeId = 3;

  @override
  OrderModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrderModel(
      id: fields[0] as String,
      customerId: fields[1] as String,
      customerName: fields[2] as String,
      customerPhone: fields[3] as String,
      items: (fields[4] as List).cast<OrderItemModel>(),
      status: fields[5] as int,
      paymentStatus: fields[6] as int,
      createdAt: fields[7] as DateTime,
      deliveryDate: fields[8] as DateTime?,
      notes: fields[9] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, OrderModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.customerId)
      ..writeByte(2)
      ..write(obj.customerName)
      ..writeByte(3)
      ..write(obj.customerPhone)
      ..writeByte(4)
      ..write(obj.items)
      ..writeByte(5)
      ..write(obj.status)
      ..writeByte(6)
      ..write(obj.paymentStatus)
      ..writeByte(7)
      ..write(obj.createdAt)
      ..writeByte(8)
      ..write(obj.deliveryDate)
      ..writeByte(9)
      ..write(obj.notes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
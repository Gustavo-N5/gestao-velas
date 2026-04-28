import 'package:hive_flutter/hive_flutter.dart';
import 'customer_model.dart';

class CustomerModelAdapter extends TypeAdapter<CustomerModel> {
  @override
  final int typeId = 0;

  @override
  CustomerModel read(BinaryReader reader) {
    return CustomerModel(
      id: reader.readString(),
      name: reader.readString(),
      phone: reader.readString(),
      street: reader.read() as String?,
      neighborhood: reader.read() as String?,
      city: reader.read() as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CustomerModel obj) {
    writer.writeString(obj.id);
    writer.writeString(obj.name);
    writer.writeString(obj.phone);
    writer.write(obj.street);
    writer.write(obj.neighborhood);
    writer.write(obj.city);
  }
}

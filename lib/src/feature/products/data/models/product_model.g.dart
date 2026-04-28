import 'package:hive/hive.dart';
import 'product_model.dart';

class ProductModelAdapter extends TypeAdapter<ProductModel> {
  @override
  final int typeId = 1;

  @override
  ProductModel read(BinaryReader reader) {
    return ProductModel(
      id: reader.readString(),
      name: reader.readString(),
      price: reader.readDouble(),
      description: reader.read() as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ProductModel obj) {
    writer.writeString(obj.id);
    writer.writeString(obj.name);
    writer.writeDouble(obj.price);
    writer.write(obj.description);
  }
}

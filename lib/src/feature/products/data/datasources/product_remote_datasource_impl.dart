import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gestao_velas/src/core/error/exceptions.dart';
import 'package:gestao_velas/src/feature/products/data/models/product_model.dart';
import 'package:gestao_velas/src/feature/products/domain/datasources/product_remote_datasource.dart';

class ProductRemoteDatasourceImpl implements ProductRemoteDatasource {
  final _col = FirebaseFirestore.instance.collection('products');

  @override
  Stream<List<ProductModel>> watchAll() {
    return _col.snapshots().map(
      (snap) => snap.docs.map((d) => ProductModel.fromMap(d.data())).toList(),
    );
  }

  @override
  Future<List<ProductModel>> getAll() async {
    try {
      final snap = await _col.get();
      return snap.docs.map((d) => ProductModel.fromMap(d.data())).toList();
    } on FirebaseException catch (e) {
      throw ServerException(e.message ?? 'Erro ao buscar produtos');
    }
  }

  @override
  Future<ProductModel?> getById(String id) async {
    try {
      final doc = await _col.doc(id).get();
      if (!doc.exists) return null;
      return ProductModel.fromMap(doc.data()!);
    } on FirebaseException catch (e) {
      throw ServerException(e.message ?? 'Erro ao buscar produto');
    }
  }

  @override
  Future<void> save(ProductModel model) async {
    try {
      await _col.doc(model.id).set(model.toMap());
    } on FirebaseException catch (e) {
      throw ServerException(e.message ?? 'Erro ao salvar produto');
    }
  }

  @override
  Future<void> update(ProductModel model) async {
    try {
      await _col.doc(model.id).update(model.toMap());
    } on FirebaseException catch (e) {
      throw ServerException(e.message ?? 'Erro ao atualizar produto');
    }
  }

  @override
  Future<void> delete(String id) async {
    try {
      await _col.doc(id).delete();
    } on FirebaseException catch (e) {
      throw ServerException(e.message ?? 'Erro ao deletar produto');
    }
  }
}

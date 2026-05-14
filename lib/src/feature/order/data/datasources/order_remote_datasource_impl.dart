import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gestao_velas/src/core/error/exceptions.dart';
import 'package:gestao_velas/src/feature/order/data/models/order_model.dart';
import 'package:gestao_velas/src/feature/order/domain/datasources/order_remote_datasource.dart';

class OrderRemoteDatasourceImpl implements OrderRemoteDatasource {
  final _col = FirebaseFirestore.instance.collection('orders');

  @override
  Stream<List<OrderModel>> watchAll() {
    return _col.snapshots().map(
      (snap) => snap.docs.map((d) => OrderModel.fromMap(d.data())).toList(),
    );
  }

  @override
  Future<List<OrderModel>> getAll() async {
    try {
      final snap = await _col.get();
      return snap.docs.map((d) => OrderModel.fromMap(d.data())).toList();
    } on FirebaseException catch (e) {
      throw ServerException(e.message ?? 'Erro ao buscar pedidos');
    }
  }

  @override
  Future<OrderModel?> getById(String id) async {
    try {
      final doc = await _col.doc(id).get();
      if (!doc.exists) return null;
      return OrderModel.fromMap(doc.data()!);
    } on FirebaseException catch (e) {
      throw ServerException(e.message ?? 'Erro ao buscar pedido');
    }
  }

  @override
  Future<void> save(OrderModel model) async {
    try {
      await _col.doc(model.id).set(model.toMap());
    } on FirebaseException catch (e) {
      throw ServerException(e.message ?? 'Erro ao salvar pedido');
    }
  }

  @override
  Future<void> update(OrderModel model) async {
    try {
      await _col.doc(model.id).update(model.toMap());
    } on FirebaseException catch (e) {
      throw ServerException(e.message ?? 'Erro ao atualizar pedido');
    }
  }

  @override
  Future<void> delete(String id) async {
    try {
      await _col.doc(id).delete();
    } on FirebaseException catch (e) {
      throw ServerException(e.message ?? 'Erro ao deletar pedido');
    }
  }
}

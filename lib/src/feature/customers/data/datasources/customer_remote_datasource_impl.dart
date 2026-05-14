import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gestao_velas/src/core/error/exceptions.dart';
import 'package:gestao_velas/src/feature/customers/data/models/customer_model.dart';
import 'package:gestao_velas/src/feature/customers/domain/datasources/customer_remote_datasource.dart';

class CustomerRemoteDatasourceImpl implements CustomerRemoteDatasource {
  final _col = FirebaseFirestore.instance.collection('customers');

  @override
  Stream<List<CustomerModel>> watchAll() {
    return _col.snapshots().map(
      (snap) => snap.docs.map((d) => CustomerModel.fromMap(d.data())).toList(),
    );
  }

  @override
  Future<List<CustomerModel>> getAll() async {
    try {
      final snap = await _col.get();
      return snap.docs.map((d) => CustomerModel.fromMap(d.data())).toList();
    } on FirebaseException catch (e) {
      throw ServerException(e.message ?? 'Erro ao buscar clientes');
    }
  }

  @override
  Future<CustomerModel?> getById(String id) async {
    try {
      final doc = await _col.doc(id).get();
      if (!doc.exists) return null;
      return CustomerModel.fromMap(doc.data()!);
    } on FirebaseException catch (e) {
      throw ServerException(e.message ?? 'Erro ao buscar cliente');
    }
  }

  @override
  Future<void> save(CustomerModel model) async {
    try {
      await _col.doc(model.id).set(model.toMap());
    } on FirebaseException catch (e) {
      throw ServerException(e.message ?? 'Erro ao salvar cliente');
    }
  }

  @override
  Future<void> update(CustomerModel model) async {
    try {
      await _col.doc(model.id).update(model.toMap());
    } on FirebaseException catch (e) {
      throw ServerException(e.message ?? 'Erro ao atualizar cliente');
    }
  }

  @override
  Future<void> delete(String id) async {
    try {
      await _col.doc(id).delete();
    } on FirebaseException catch (e) {
      throw ServerException(e.message ?? 'Erro ao deletar cliente');
    }
  }
}

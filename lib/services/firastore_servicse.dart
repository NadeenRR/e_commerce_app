import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class FirestoreServicse {
  // constractor private
  FirestoreServicse._();
  static final instance = FirestoreServicse._();
  final fireStore = FirebaseFirestore.instance;

  Future<void> setData(
      {required String path, required Map<String, dynamic> data}) async {
    // the data store in doc
    final reference = fireStore.doc(path);
    debugPrint('Request data: $data');
    await reference.set(data);
  }

  Future<void> deleteData({required String path}) async {
    final refrance = fireStore.doc(path);
    debugPrint('Path: $path');
    await refrance.delete();
  }

  Stream<T> docummetsStream<T>(
      {required String path,
      required T Function(Map<String, dynamic>? data, String docId) builder}) {
    final refrance = fireStore.doc(path);
    // to get the set collection in doc
    final snapshots = refrance.snapshots();
    return snapshots.map((snapshot) => builder(snapshot.data(), snapshot.id));
  }

  Stream<List<T>> collectionsStream<T>({
    required String path,
    required T Function(Map<String, dynamic>? data, String docId) builder,
    Query Function(Query query)? QueryBuilder,
    int Function(T ths, T rhs)? sort,
  }) {
    Query query = fireStore.collection(path);
    if (QueryBuilder != null) {
      query = QueryBuilder(query);
    }
    // refrance for doc in the straem
    final snapshots = query.snapshots();
    return snapshots.map((snapshot) {
      final result = snapshot.docs
          .map((snapshot) =>
              builder(snapshot.data() as Map<String, dynamic>, snapshot.id))
          .where((value) => value != null)
          .toList();

      if (sort != null) {
        result.sort(sort);
      }
      return result;
    });
  }
}

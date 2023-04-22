// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce_app/models/prodect.dart';
import 'package:e_commerce_app/utils/api_path.dart';

import '../services/firastore_servicse.dart';

abstract class Database {
  Stream<List<Prodect>> salesProdectsStream();
  Stream<List<Prodect>> newsProdectsStream();
}

class Firestore implements Database {
  @override
  final service = FirestoreServicse.instance;
  final String uid;
  Firestore({
    required this.uid,
  });

  @override
  Stream<List<Prodect>> salesProdectsStream() => service.collectionsStream(
      path: ApiPath.prodect(),
      builder: (data, docId) => Prodect.fromMap(data!, docId),
      QueryBuilder: (query) => query.where('discountValue', isNotEqualTo: 0));

  @override
  Stream<List<Prodect>> newsProdectsStream() => service.collectionsStream(
        path: ApiPath.prodect(),
        builder: (data, docId) => Prodect.fromMap(data!, docId),
      );
}

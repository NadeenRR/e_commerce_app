import 'package:e_commerce_app/models/prodect.dart';

import '../services/firastore_servicse.dart';

abstract class Database {
  Stream<List<Prodect>> prodectsStream();
}

class Firestore implements Database {
  @override
  final service = FirestoreServicse.instance;

  @override
  Stream<List<Prodect>> prodectsStream() => service.collectionsStream(
      path: 'products/',
      builder: (data, docId) => Prodect.fromMap(data!, docId));
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce_app/utils/assets.dart';

class Prodect {
  final String id;
  final String title;
  final int price;
  final String imageUrl;
  final int discountValue;
  final String categore;
  final double? rate;

  Prodect({
    required this.id,
    required this.title,
    required this.price,
    required this.imageUrl,
    this.discountValue = 0,
    this.categore = 'other',
    this.rate,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'price': price,
      'imageUrl': imageUrl,
      'discountValue': discountValue,
      'categore': categore,
      'rate': rate,
    };
  }

  factory Prodect.fromMap(Map<String, dynamic> map, String docId) {
    return Prodect(
      id: docId,
      title: map['title'] as String,
      price: map['price'] as int,
      imageUrl: map['imageUrl'] as String,
      discountValue: map['discountValue'] as int,
      categore: map['categore'] as String,
      rate: map['rate'] != null ? map['rate'] as double : null,
    );
  }
}
  List<Prodect> dummyProdect = [
    Prodect(
      id: '1',
      title: 'T-shirt',
      price: 300,
      imageUrl: AppAssets.tShirtItem,
      categore: 'Clothes',
      discountValue: 20,
    ),
    Prodect(
      id: '2',
      title: 'T-shirt',
      price: 300,
      imageUrl: AppAssets.tShirtItem,
      categore: 'Clothes',
      discountValue: 20,
    ),
    Prodect(
      id: '3',
      title: 'T-shirt',
      price: 300,
      imageUrl: AppAssets.tShirtItem,
      categore: 'Clothes',
      discountValue: 20,
    ),
    Prodect(
      id: '4',
      title: 'T-shirt',
      price: 300,
      imageUrl: AppAssets.tShirtItem,
      categore: 'Clothes',
      discountValue: 20,
    ),
    Prodect(
      id: '5',
      title: 'T-shirt',
      price: 300,
      imageUrl: AppAssets.tShirtItem,
      categore: 'Clothes',
      discountValue: 20,
    ),
    Prodect(
      id: '6',
      title: 'T-shirt',
      price: 300,
      imageUrl: AppAssets.tShirtItem,
      categore: 'Clothes',
      discountValue: 20,
    ),
  ];
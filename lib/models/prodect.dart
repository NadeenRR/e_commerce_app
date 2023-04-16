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
}

List<Prodect> dummyProdects = [
  Prodect(
      id: '1',
      title: 'T-shirt',
      price: 300,
      imageUrl: AppAssets.tShirtItem,
      categore: 'clothes',
      discountValue: 20),
  Prodect(
      id: '2',
      title: 'T-shirt',
      price: 300,
      imageUrl: AppAssets.tShirtItem,
      categore: 'clothes',
      discountValue: 20),
  Prodect(
      id: '3',
      title: 'T-shirt',
      price: 300,
      imageUrl: AppAssets.tShirtItem,
      categore: 'clothes',
      discountValue: 20),
  Prodect(
      id: '4',
      title: 'T-shirt',
      price: 300,
      imageUrl: AppAssets.tShirtItem,
      categore: 'clothes',
      discountValue: 20),
  Prodect(
      id: '5',
      title: 'T-shirt',
      price: 300,
      imageUrl: AppAssets.tShirtItem,
      categore: 'clothes',
      discountValue: 20),
];

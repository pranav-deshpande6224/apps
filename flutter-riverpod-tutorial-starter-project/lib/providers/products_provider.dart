import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_files/models/product.dart';

const List<Product> allProducts = [
  Product(
      id: '1',
      title: 'back-pack',
      price: 45,
      image: 'assets/products/backpack.png'),
  Product(id: '2', title: 'drum', price: 30, image: 'assets/products/drum.png'),
  Product(
      id: '3', title: 'guitar', price: 20, image: 'assets/products/guitar.png'),
  Product(
      id: '4', title: 'jeans', price: 10, image: 'assets/products/jeans.png'),
  Product(
      id: '5', title: 'karati', price: 52, image: 'assets/products/karati.png'),
  Product(
      id: '6', title: 'shorts', price: 49, image: 'assets/products/shorts.png'),
  Product(
      id: '7', title: 'skates', price: 79, image: 'assets/products/skates.png'),
  Product(
      id: '8',
      title: 'suitcase',
      price: 67,
      image: 'assets/products/suitcase.png'),
];

final allProductsProvider = Provider((ref) {
  return allProducts;
});

final reducedproductsProvider = Provider((ref) {
  return allProducts.where((element) {
    return element.price <= 50;
  });
});

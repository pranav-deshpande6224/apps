import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_files/models/product.dart';

class CartNotifier extends Notifier<Set<Product>> {
  // initial value
  @override
  Set<Product> build() {
    return {};
  }

  // updating the state
  void addProduct(Product product) {
    if (!state.contains(product)) {
      // dont use add method
      // need to provide the new state
      // i.e new set
      // not the existing set
      state = {...state, product};
    }
  }

  void removeProduct(Product product) {
    if (state.contains(product)) {
      state.remove(product);
      state = {...state};
    }
  }
}

final cartNotifierProvider = NotifierProvider<CartNotifier, Set<Product>>(() {
  return CartNotifier();
});

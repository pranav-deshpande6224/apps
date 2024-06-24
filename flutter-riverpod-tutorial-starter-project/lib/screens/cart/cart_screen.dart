import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_files/models/product.dart';
import 'package:riverpod_files/providers/cart_provider.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  bool showCoupon = true;

  Widget getTotalWidget(Set<Product> cartProduct) {
    int sum = 0;
    print('text get executed');
    for (Product product in cartProduct) {
      sum += product.price;
    }
    return Text('The Total is $sum');
  }

  @override
  Widget build(BuildContext context) {
    print('build of consumer stateful widget');
    final cartProducts = ref.watch(cartNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
        centerTitle: true,
        // actions: [],
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: cartProducts.isEmpty
            ? const Center(child: Text('No Items is there in the cart'))
            : Column(
                children: [
                  Column(
                    children: cartProducts.map((element) {
                      return Row(
                        children: [
                          Image.asset(
                            element.image,
                            height: 60,
                            width: 60,
                          ),
                          const SizedBox(width: 20),
                          Text(element.title),
                          const Expanded(
                            child: SizedBox(),
                          ),
                          Text('\$ ${element.price}')
                        ],
                      );
                    }).toList(), // output cart products here
                  ),
                  getTotalWidget(cartProducts)
                ],
              ),
      ),
    );
  }
}

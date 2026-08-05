import 'package:flutter/material.dart';

import '../../data/cart_store.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: CartStore.cartItems.isEmpty
          ? const Center(child: Text('Your cart is empty'))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: CartStore.cartItems.length,
                    itemBuilder: (context, index) {
                      final item = CartStore.cartItems[index];
                      return ListTile(
                        title: Text(item.name),
                        trailing: Text('${item.price} PKR'),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Total'),
                      Text('${CartStore.totalPrice} PKR'),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}

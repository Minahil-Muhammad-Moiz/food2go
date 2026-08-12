import 'package:flutter/material.dart';
import '../../models/food_item.dart';

class FoodCard extends StatelessWidget {
  final FoodItem item;
  final VoidCallback? onTap;

  const FoodCard({super.key, required this.item, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12),
      child: ListTile(
        // onTap: onTap,
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(item.image),
        ),
        title: Text(item.name),
        subtitle: Text('${item.price} PKR'),
        // trailing: IconButton(
        //   icon: const Icon(Icons.add_shopping_cart),
        //   onPressed: onTap,
        // ),
      ),
    );
  }
}

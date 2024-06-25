import 'package:section11/Models/grocery_item.dart';
import 'package:flutter/material.dart';

class GroceryListItem extends StatelessWidget {
  const GroceryListItem({super.key, required this.item});
  final GroceryItem item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 24,
        width: 24,
        color: item.category.color,
      ),
      title: Text(
        item.name,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      trailing: Text(
        '${item.quantity}',
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:section11/Data/dummy_items.dart';
import 'package:section11/Widgets/grocery_list_Item.dart';

class GroceryScreen extends StatelessWidget {
  const GroceryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        title: const Text('Groceries'),
      ),
      body: ListView.builder(
          itemCount: groceryItems.length,
          itemBuilder: (ctx, index) {
            return GroceryListItem(
              item: groceryItems[index],
            );
          }),
    );
  }
}

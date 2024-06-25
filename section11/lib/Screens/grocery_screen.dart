import 'package:flutter/material.dart';
import 'package:section11/Data/dummy_items.dart';
import 'package:section11/Screens/grocery_new_item_screen.dart';
import 'package:section11/Widgets/grocery_list_Item.dart';

class GroceryScreen extends StatelessWidget {
  const GroceryScreen({super.key});

  void _moveToGroceryNewItemScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
      builder: (ctx) {
      return const GroceryNewItemScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        title: const Text('Your Groceries'),
        actions: [
          IconButton(
              onPressed: () {
                _moveToGroceryNewItemScreen(context);
              },
              icon: const Icon(Icons.add))
        ],
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

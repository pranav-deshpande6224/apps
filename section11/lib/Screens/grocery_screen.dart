import 'package:flutter/material.dart';

import 'package:section11/Models/grocery_item.dart';
import 'package:section11/Screens/grocery_new_item_screen.dart';
import 'package:section11/Widgets/grocery_list_Item.dart';

class GroceryScreen extends StatefulWidget {
  const GroceryScreen({super.key});

  @override
  State<GroceryScreen> createState() => _GroceryScreenState();
}

class _GroceryScreenState extends State<GroceryScreen> {
  final List<GroceryItem> _groceryItems = [];

  void _moveToGroceryNewItemScreen() async {
    final result =
        await Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
      return const GroceryNewItemScreen();
    }));
    if (result == null) {
      return;
    }
    setState(() {
      _groceryItems.add(result);
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        elevation: 5,
        title: const Text('Your Groceries'),
        actions: [
          IconButton(
              onPressed: () {
                _moveToGroceryNewItemScreen();
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: _groceryItems.isEmpty ? const Center(child: Text('No Grocery Items, Please add')) :ListView.builder(
          itemCount: _groceryItems.length,
          itemBuilder: (ctx, index) {
            return Dismissible(
              key : ValueKey(_groceryItems[index]),
              child: GroceryListItem(
                item: _groceryItems[index],
              ),
            );
          }),
    );
  }
}

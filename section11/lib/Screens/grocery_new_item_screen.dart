import 'package:flutter/material.dart';

// when handling the form or handling the textfield
// please go with stateful widget
// for the ListView, grid view
// we can go with stateless widget

class GroceryNewItemScreen extends StatefulWidget {
  const GroceryNewItemScreen({super.key});
  @override
  State<GroceryNewItemScreen> createState() {
    return _GroceryNewItemScreenState();
  }
}

class _GroceryNewItemScreenState extends State<GroceryNewItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Item'),
      ),
      body: const Padding(
        padding:  EdgeInsets.all(12),
        child: Text('the Form'),
      ),
    );
  }
}

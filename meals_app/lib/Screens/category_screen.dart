// In the main screen list of categories are found
import 'package:flutter/material.dart';
import 'package:meals_app/Data/dummy_data.dart';
import 'package:meals_app/Widgets/category_grid_view_element.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 8,
        title: const Text('Pick Your Category'),
      ),
      body: GridView(
        padding: const EdgeInsets.only(
          left: 15,
          right: 15,
          top: 20,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
        children: availableCategories.map((element) {
          return CategoryGridViewElement(
            category: element,
          );
        }).toList(),
      ),
    );
  }
}

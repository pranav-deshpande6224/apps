// In the main screen list of categories are found
import 'package:flutter/material.dart';
import 'package:meals_app/Data/dummy_data.dart';
import 'package:meals_app/Models/category.dart';
import 'package:meals_app/Models/meal.dart';
import 'package:meals_app/Screens/meals_screen.dart';
import 'package:meals_app/Widgets/category_grid_view_element.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  void _selectedCategory(BuildContext context, Category category) {
    final List<Meal> categoryMeals = dummyMeals.where((element) {
      return element.categories.contains(category.id);
    }).toList();
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
      return MealsScreen(
        title: category.title,
        meals: categoryMeals,
      );
    }));
  }

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
            categorySelected: _selectedCategory,
          );
        }).toList(),
      ),
    );
  }
}

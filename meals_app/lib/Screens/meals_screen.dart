import 'package:flutter/material.dart';
import 'package:meals_app/Models/meal.dart';
import 'package:meals_app/Widgets/meal_item.dart';

// if you click on that category
// that category title is on the appbar
// meals of that category is displayed in the form of list.
class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    required this.title,
    required this.meals,
  });
  final String title;
  final List<Meal> meals;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: meals.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Uh oh ... nothing here!',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Try Selecting different category',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            )
          : ListView.builder(
              itemCount: meals.length,
              itemBuilder: (ctx, index) {
                return MealItem(
                  meal: meals[index],
                );
              }),
    );
  }
}

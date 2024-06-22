import 'package:flutter/material.dart';
import 'package:meals_app/Models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({super.key, required this.meal});
  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          meal.mealTitle,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

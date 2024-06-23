import 'package:flutter/material.dart';
import 'package:meals_app/Models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({super.key, required this.meal, required this.addRemovefavourites});
  final Meal meal;
  final void Function(Meal meal) addRemovefavourites;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.mealTitle),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.star))],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            Image.network(
              meal.imageURL,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 14,
            ),
            const Text(
              'Ingridients',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            ...meal.ingredients.map((element) =>
                Text(element, style: const TextStyle(color: Colors.white))),
            const SizedBox(
              height: 24,
            ),
            const Text(
              'Steps',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            ...meal.steps.map((element) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(element,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white)),
                ))
          ],
        ),
      ),
    );
  }
}

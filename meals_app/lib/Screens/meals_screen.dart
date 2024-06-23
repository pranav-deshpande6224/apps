import 'package:flutter/material.dart';
import 'package:meals_app/Models/meal.dart';
import 'package:meals_app/Screens/meal_details_screen.dart';
import 'package:meals_app/Widgets/meal_item.dart';

// if you click on that category
// that category title is on the appbar
// meals of that category is displayed in the form of list.
class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.meals,
    required this.addRemoveFavourite,
  });
  final String? title;
  final List<Meal> meals;
  final void Function(Meal meal) addRemoveFavourite;

  void _toMealDetailScreen(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealDetailsScreen(
          meal: meal,
          addRemovefavourites: addRemoveFavourite,
        ),
      ),
    );
  }

  Widget get content {
    return meals.isEmpty
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
                toDetailScreen: _toMealDetailScreen,
              );
            });
  }

  @override
  Widget build(BuildContext context) {
    if (title == null) {
      print('title is null ');
      return content;
    }
    // doing force unwrap because title here can't be null
    return Scaffold(
        appBar: AppBar(
          title: Text(title!),
        ),
        body: content);
  }
}

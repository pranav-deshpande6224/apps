enum Complexity {
  easy,
  medium,
  hard,
}

enum Affordability {
  affordable,
  pricey,
  luxirious,
}

class Meal {
  final String id;
  final String mealTitle;
  final String imageURL;
  final List<String> ingredients;
  final List<String> categories;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;
  const Meal({
    required this.id,
    required this.mealTitle,
    required this.imageURL,
    required this.ingredients,
    required this.categories,
    required this.steps,
    required this.duration,
    required this.complexity,
    required this.affordability,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
  });
}

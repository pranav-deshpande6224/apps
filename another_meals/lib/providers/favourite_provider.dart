import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

// mark as favourite the state changes
// better to use StateNotifierProvider
// it works with StateNotifier

class FavouriteMealNotifier extends StateNotifier<List<Meal>> {
  // initially favourite is empty
  // so it is empty list
  FavouriteMealNotifier() : super([]);

  //methods to change the state
  // without editing the existing state

  void addRemoveMeal(Meal meal) {
    if (!state.contains(meal)) {
      // new state is provided
      state = [...state, meal];
    } else {
      // don't use the add and remove method
      state = state.where((m) => m.id != meal.id).toList();
    }
  }
}

final favouriteMealsProvider = StateNotifierProvider<FavouriteMealNotifier, List<Meal>>((ref) {
  return FavouriteMealNotifier();
});

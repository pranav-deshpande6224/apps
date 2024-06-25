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

  bool addRemoveMeal(Meal meal) {
    if (!state.contains(meal)) {
      // new state is provided
      state = [...state, meal];
      return true;
    } else {
      // don't use the add and remove method
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    }
  }
}

final favouriteMealsProvider =
    StateNotifierProvider<FavouriteMealNotifier, List<Meal>>((ref) {
  return FavouriteMealNotifier();
});

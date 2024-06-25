import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/providers/meals_provider.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
      : super({
          Filter.glutenFree: false,
          Filter.lactoseFree: false,
          Filter.vegetarian: false,
          Filter.vegan: false
        });

  void setFilters(Map<Filter, bool> allFilters) {
    print(allFilters);
    state = allFilters;
  }

  void setFilter(Filter filter, bool isActive) {
    final newMap = {...state};
    newMap[filter] = isActive;
    state = newMap;
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>(
        (ref) => FiltersNotifier());

final filtersMealsProvider = Provider<List<Meal>>((ref) {
  // this is the same ref that is used in the widgets
  // here we are using watch function of that ref
  // if the data changes then this function inside the provider
  // will reexecute again and this provider provide the updated data
  final meals = ref.watch(dummyMealsProvider);
  final filters = ref.watch(filtersProvider);
  final availableMeals = meals.where((meal) {
    if (filters[Filter.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (filters[Filter.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (filters[Filter.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    if (filters[Filter.vegan]! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
  return availableMeals;
});

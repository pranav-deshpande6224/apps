import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meal.dart';

final dummyMealsProvider = Provider<List<Meal>>((ref) => dummyMeals);

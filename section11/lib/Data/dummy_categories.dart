import 'package:section11/Models/category.dart';
import 'package:flutter/material.dart';

final Map<Categories, Category> dummyCategories = {
  Categories.vegetable: 
  Category(title: 'Vegetables', color: const Color.fromARGB(255, 0, 255, 128)),
  Categories.fruit:
      Category(title: 'fruit', color: const Color.fromARGB(255, 145, 255, 0)),
  Categories.meat:
      Category(title: 'meat', color: const Color.fromARGB(255, 255, 102, 0)),
  Categories.dairy:
      Category(title: 'diary', color: const Color.fromARGB(255, 0, 208, 255)),
  Categories.carbs:
      Category(title: 'carbs', color: const Color.fromARGB(255, 0, 60, 255)),
  Categories.sweets: 
  Category(
    title: 'Sweets',
    color: const Color.fromARGB(255, 255, 149, 0),
  ),
  Categories.spices: Category(
    title: 'spices',
    color: const Color.fromARGB(255, 255, 187, 0),
  ),
  Categories.convinience: Category(
    title: 'convinience',
    color: const Color.fromARGB(255, 191, 0, 255),
  ),
  Categories.hygiene: Category(
    title: 'hygiene',
    color: const Color.fromARGB(255, 149, 0, 255),
  ),
  Categories.other: Category(
    title: 'Other',
    color: const Color.fromARGB(255, 0, 255, 255),
  )
};

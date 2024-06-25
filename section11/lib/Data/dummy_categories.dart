import 'package:section11/Models/category.dart';
import 'package:flutter/material.dart';

const  Map<Categories, Category> dummyCategories = {
  Categories.vegetable: 
  Category(title: 'Vegetables', color:  Color.fromARGB(255, 0, 255, 128)),
  Categories.fruit:
      Category(title: 'fruit', color:  Color.fromARGB(255, 145, 255, 0)),
  Categories.meat:
      Category(title: 'meat', color:  Color.fromARGB(255, 255, 102, 0)),
  Categories.dairy:
      Category(title: 'diary', color:  Color.fromARGB(255, 0, 208, 255)),
  Categories.carbs:
      Category(title: 'carbs', color:  Color.fromARGB(255, 0, 60, 255)),
  Categories.sweets: 
  Category(
    title: 'Sweets',
    color:  Color.fromARGB(255, 255, 149, 0),
  ),
  Categories.spices: Category(
    title: 'spices',
    color:  Color.fromARGB(255, 255, 187, 0),
  ),
  Categories.convinience: Category(
    title: 'convinience',
    color:  Color.fromARGB(255, 191, 0, 255),
  ),
  Categories.hygiene: Category(
    title: 'hygiene',
    color:  Color.fromARGB(255, 149, 0, 255),
  ),
  Categories.other: Category(
    title: 'Other',
    color:  Color.fromARGB(255, 0, 255, 255),
  )
};

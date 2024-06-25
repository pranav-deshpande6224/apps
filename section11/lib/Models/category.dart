import 'package:flutter/material.dart';

enum Categories {
  vegetable,
  fruit,
  meat,
  dairy,
  carbs,
  sweets,
  spices,
  convinience,
  hygiene,
  other

}

class Category {
  final String title;
 final Color color;
  const Category({required this.title, required this.color});
}

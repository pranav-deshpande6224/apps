import 'package:flutter/material.dart';

enum Categories {
  vegetable,
  fruit,
  meat,
  dairy,
  carbs
}

class Category {
  String title;
  Color color;
  Category({required this.title, required this.color});
}

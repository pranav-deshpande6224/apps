import 'package:section11/Data/dummy_categories.dart';
import 'package:section11/Models/category.dart';
import 'package:section11/Models/grocery_item.dart';

final groceryItems = [
  GroceryItem(id:'a',name: 'Milk',quantity: 1 , category: dummyCategories[Categories.dairy]!),
  GroceryItem(id:'b',name: 'Banana',quantity: 5 , category: dummyCategories[Categories.fruit]! ),
  GroceryItem(id:'c',name: 'Chicken',quantity: 1 , category: dummyCategories[Categories.meat]!),
];

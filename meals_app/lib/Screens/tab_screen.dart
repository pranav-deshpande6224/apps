import 'package:flutter/material.dart';
import 'package:meals_app/Models/meal.dart';
import 'package:meals_app/Screens/category_screen.dart';
import 'package:meals_app/Screens/meals_screen.dart';
// switching between the tabs
// we update the screen
// so we go with stateful widget

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectedPageIndex = 0;
  final List<Meal> _favouriteMeals = [];
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _makeFavourite(Meal meal) {
    var favItem = _favouriteMeals.contains(meal);
    if (favItem) {
      _favouriteMeals.remove(meal);
    } else {
      _favouriteMeals.add(meal);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoryScreen(favourite: _makeFavourite,);
    if (_selectedPageIndex == 1) {
      activePage = MealsScreen(meals: [], addRemoveFavourite: _makeFavourite,);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(_selectedPageIndex == 0 ? 'Categories' : 'Your Favourites'),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          _selectPage(index);
        },
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.set_meal,
            ),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.star,
            ),
            label: 'Favourite',
          )
        ],
      ),
    );
  }
}

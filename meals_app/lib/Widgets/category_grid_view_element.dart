import 'package:flutter/material.dart';
import 'package:meals_app/Models/category.dart';

class CategoryGridViewElement extends StatelessWidget {
  const CategoryGridViewElement(
      {super.key, required this.category, required this.categorySelected});
  final Category category;
  final void Function(BuildContext context, Category category) categorySelected;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: const Color.fromARGB(31, 166, 94, 94),
      onTap: () {
        categorySelected(context, category);
      },
      borderRadius: BorderRadius.circular(10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.9),
              category.color.withOpacity(0.7)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Text(
            category.title,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
          ),
        ),
      ),
    );
  }
}

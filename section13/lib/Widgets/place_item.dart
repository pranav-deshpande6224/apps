import 'package:flutter/material.dart';
import 'package:section13/Models/place.dart';

class PlaceItem extends StatelessWidget {
  final Place place;
  final void Function(BuildContext context) mealDetailFunction;
  const PlaceItem({
    super.key,
    required this.place,
    required this.mealDetailFunction,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        mealDetailFunction(context);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          place.placeTitle,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

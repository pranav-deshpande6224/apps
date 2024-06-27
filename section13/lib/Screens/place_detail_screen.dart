import 'package:flutter/material.dart';
import 'package:section13/Models/place.dart';

class PlaceDetailScreen extends StatelessWidget {
  const PlaceDetailScreen({super.key, required this.place});
  final Place place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        title: Text(place.placeTitle),
      ),
      body: Center(
        child: Text(place.placeTitle),
      ),
    );
  }
}

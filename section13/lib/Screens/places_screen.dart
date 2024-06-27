import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:section13/Providers/place_provider.dart';
import 'package:section13/Screens/add_new_place.dart';
import 'package:section13/Screens/place_detail_screen.dart';
import 'package:section13/Widgets/place_item.dart';

class Places extends ConsumerWidget {
  const Places({super.key});

  void _moveToDetailScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (ctx) => const PlaceDetailScreen(),
    ));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final placesList = ref.watch(placesProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(
            iconSize: 30,
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                return const AddNewPlace();
              }));
            },
            icon: const Icon(Icons.add),
          )
        ],
        elevation: 10,
      ),
      body: placesList.isEmpty
          ? const Center(
              child: Text('No Places Added yet'),
            )
          : Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                itemCount: placesList.length,
                itemBuilder: (ctx, index) {
                  return PlaceItem(
                    place: placesList[index],
                    mealDetailFunction: _moveToDetailScreen,
                  );
                },
              ),
            ),
    );
  }
}

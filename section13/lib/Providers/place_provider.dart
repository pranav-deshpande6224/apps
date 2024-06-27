import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:section13/Models/place.dart';

class NewPlaceProvider extends StateNotifier<List<Place>> {
  NewPlaceProvider() : super([]);

  void addNewItem(Place place) {
    state = [...state, place];
  }
}

final placesProvider =
    StateNotifierProvider<NewPlaceProvider, List<Place>>((ref) {
  return NewPlaceProvider();
});

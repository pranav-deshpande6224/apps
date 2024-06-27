import 'package:flutter/material.dart';
import 'package:section13/Screens/places_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp( const ProviderScope(child: App(),));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'favourite Places',
      home: PlacesScreen(),
    );
  }
}

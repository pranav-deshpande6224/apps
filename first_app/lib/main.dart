import 'package:first_app/gradient_container.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 59, 36, 97),
        body: GradientContainer([Colors.amber, Colors.pink],
            Alignment.bottomLeft, Alignment.topRight),
      ),
    );
  }
}

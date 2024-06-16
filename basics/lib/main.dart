import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              color: Colors.red,
              height: 50,
              width: 100,
            ),
            Container(
              color: Colors.green,
              height: 150,
              width: 150,
            ),
            Container(
              color: Colors.yellow,
              height: 170,
              width: 120,
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key,});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.yellow, Colors.pink],
        ),
      ),
      child: const Center(
        child: Text(
          'Hello world',
          style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

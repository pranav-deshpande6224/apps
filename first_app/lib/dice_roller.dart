import 'package:flutter/material.dart';
import 'dart:math';

class DiceRoller extends StatefulWidget {
  final List<String> imageString = [
    'assets/images/dice-1.png',
    'assets/images/dice-2.png',
    'assets/images/dice-3.png',
    'assets/images/dice-4.png',
    'assets/images/dice-5.png',
    'assets/images/dice-6.png'
  ];
  DiceRoller({super.key});

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  void rollDice() {
  
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/dice-1.png',
          width: 200,
        ),
        const SizedBox(
          height: 20,
        ),
        TextButton(
          style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              textStyle:
                  const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          onPressed: rollDice,
          child: const Text(
            'Roll Dice',
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }
}

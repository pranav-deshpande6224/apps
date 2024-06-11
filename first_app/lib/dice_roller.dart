import 'package:flutter/material.dart';
import 'dart:math';

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  var randomNumber = 3;
  final random = Random();
  void rollDice() {
    var someValue = random.nextInt(5) + 1;
    setState(() {
      randomNumber = someValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build calling');
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/dice-$randomNumber.png',
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

// import 'package:first_app/styled_text.dart';
import 'package:first_app/dice_roller.dart';
import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  final List<Color> gradColors;
  final Alignment align1;
  final Alignment align2;
  
  const GradientContainer(
    this.gradColors,
    this.align1,
    this.align2, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: align1,
          end: align2,
          colors: gradColors,
        ),
      ),
      child: Center(
        child: DiceRoller()
      ),
    );
  }
}

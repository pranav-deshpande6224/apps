import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final String answer;
  final void Function() ontap;
  const AnswerButton(this.answer, this.ontap, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(5.0), // Set the corner radius here
          ),
        ),
        onPressed: ontap,
        child: Text(
          answer,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

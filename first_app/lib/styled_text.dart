import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  final String someText;
  const StyledText(this.someText,{super.key,});

  @override
  Widget build(BuildContext context) {
    return Text(someText,
      style: const TextStyle(
          color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
    );
  }
}

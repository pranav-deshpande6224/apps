import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});
  final void Function() startQuiz;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.amber,
                Colors.pink,
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/quiz-logo.png',
                  width: 250,
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Learn Flutter the fun way!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                  ),
                  icon: const Icon(Icons.arrow_right_alt),
                  onPressed: startQuiz,
                  label: const Text('Start Quiz'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

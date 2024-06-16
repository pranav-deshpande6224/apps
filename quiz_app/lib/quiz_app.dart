import 'package:flutter/material.dart';
import 'package:quiz_app/Data/dummy.dart';
import 'package:quiz_app/questions.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/start_screen.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  var activeScreen = 'start-screen';
  List<String> selectedAnswers = [];

  void addToList(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  void switchScreen() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'question-screen';
    });
  }

  Widget returnWidget() {
    if (activeScreen == 'results-screen') {
      return ResultsScreen(switchScreen, selectedAnswers);
    }
    return activeScreen == 'start-screen'
        ? StartScreen(switchScreen)
        : QuestionsScreen(
            listOfAnswers: addToList,
          );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
          child: returnWidget(),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/Data/dummy.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});
  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  void onTap() {}
  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[0];
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              softWrap: true,
              currentQuestion.question,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestion.answers.shuffle().map((element) {
              return AnswerButton(element, onTap);
            })
          ],
        ),
      ),
    );
  }
}

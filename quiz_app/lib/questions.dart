import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/Data/dummy.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});
  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  void onTap() {
    setState(() {
      if (index == questions.length - 1) {
        index = 0;
      } else {
        index += 1;
      }
    });
  }

  var index = 0;
  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[index];
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
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestion.getShuffledAnswers().map((element) {
              return AnswerButton(element, onTap);
            })
          ],
        ),
      ),
    );
  }
}

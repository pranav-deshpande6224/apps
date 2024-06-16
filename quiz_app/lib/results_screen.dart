import 'package:flutter/material.dart';
import 'package:quiz_app/Models/quiz_question.dart';
import 'package:quiz_app/question_summary.dart';
import 'Data/dummy.dart';

class ResultsScreen extends StatelessWidget {
  final void Function() restart;
  final List<String> answersMarked;
  const ResultsScreen(this.restart, this.answersMarked, {super.key});
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> data = [];
    for (int i = 0; i < answersMarked.length; i++) {
      data.add({
        'question-index': i,
        'question': questions[i].question,
        'correct-answer': questions[i].answers[0],
        'marked-answer': answersMarked[i]
      });
    }
    return data;
  }

  Widget finalResults(QuizQuestion obj) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5), // Adjust the radius as needed
        ),
        child: SizedBox(
          width: double.infinity,
          height: 90,
          child: Column(
            children: [
              Text(
                obj.question,
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                obj.answers[0],
                style: const TextStyle(color: Color.fromARGB(255, 92, 185, 96)),
              ),
              Text(answersMarked[0]),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('You answered 3 out of 6 correctly!'),
        const SizedBox(
          height: 20,
        ),
        QuestionSummary(getSummaryData()),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton.icon(
          onPressed: restart,
          label: const Text('Restart Quiz'),
          icon: const Icon(Icons.restart_alt),
        )
      ],
    ));
  }
}

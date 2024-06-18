import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    final summary = getSummaryData();
    final String numberOfQuestions = questions.length.toString();
    final numberOfCorrect = summary
        .where((element) {
          return (element['correct-answer'] as String) ==
              (element['marked-answer'] as String);
        })
        .length
        .toString();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'You answered $numberOfCorrect out of $numberOfQuestions questions correctly!',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          QuestionSummary(summary),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton.icon(
            onPressed: restart,
            label: const Text('Restart Quiz'),
            icon: const Icon(Icons.restart_alt),
          )
        ],
      ),
    );
  }
}

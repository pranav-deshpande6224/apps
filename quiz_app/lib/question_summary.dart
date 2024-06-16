import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  final List<Map<String, Object>> summary;
  const QuestionSummary(this.summary, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: summary.map((element) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ((element['question-index'] as int) + 1).toString(),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      element['question'] as String,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(element['marked-answer'] as String),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(element['correct-answer'] as String),
                  ],
                ),
              )
            ],
          );
        }).toList(),
      ),
    );
  }
}

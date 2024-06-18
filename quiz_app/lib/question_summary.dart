import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  final List<Map<String, Object>> summary;
  const QuestionSummary(this.summary, {super.key});

  Text getTextWidget(String data,
      {Color? colorObj, double? fontSizeObj, FontWeight? objWeight}) {
    return Text(
      data,
      style: TextStyle(
        color: colorObj,
        fontWeight: objWeight,
        fontSize: fontSizeObj,
      ),
    );
  }

  Widget makeUIChangeOfText() {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: summary.map((element) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (element['marked-answer'] as String) ==
                              (element['correct-answer'] as String)
                          ? const Color.fromARGB(255, 87, 172, 90)
                          : const Color.fromARGB(255, 158, 64, 175),
                    ),
                    child: Center(
                      child: getTextWidget(
                        ((element['question-index'] as int) + 1).toString(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getTextWidget(
                          element['question'] as String,
                          colorObj: Colors.white,
                          fontSizeObj: 15,
                          objWeight: FontWeight.bold,
                        ),
                        getTextWidget(
                          element['marked-answer'] as String,
                          colorObj: Colors.white70,
                          objWeight: FontWeight.bold,
                        ),
                        getTextWidget(
                          element['correct-answer'] as String,
                          colorObj: const Color.fromARGB(255, 36, 96, 198),
                          objWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                  )
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

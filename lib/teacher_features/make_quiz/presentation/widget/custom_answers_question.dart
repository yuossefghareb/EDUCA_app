import 'package:flutter/material.dart';

class CustomAnswersQuestion extends StatelessWidget {
  const CustomAnswersQuestion({
    super.key,
    required this.charAnswer,
    required this.idex,
    required this.answer,
    required this.correctAnswer,
  });

  final String answer;
  final String charAnswer;
  final String correctAnswer;
  final int idex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      child: Text(
        "$charAnswer : $answer",
        style: TextStyle(
          color: answer == correctAnswer ? Colors.green : Colors.red,
          fontSize: 19,
        ),
        textDirection: TextDirection.rtl,
      ),
    );
  }
}

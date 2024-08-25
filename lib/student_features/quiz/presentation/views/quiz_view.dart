import 'package:flutter/material.dart';

import '../widgets/quiz_view_body.dart';

class QuizView extends StatelessWidget {
  const QuizView({super.key, required this.quizID});
  final int quizID;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: QuizViewBody(quizID: quizID)),
    );
  }
}

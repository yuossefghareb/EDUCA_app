import 'package:field_training_app/Core/models/question_model.dart';
import 'package:field_training_app/Core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'quiz_answer_item.dart';

class QuestionAndAnswer extends StatelessWidget {
  const QuestionAndAnswer(
      {super.key,
      required this.questionIndex,
      required this.answers,
      required this.questionModel});

  final int questionIndex;
  final QuestionModel questionModel;
  final List<String> answers;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          questionModel.question,
          style: Styles.textStyle18,
          textDirection: TextDirection.rtl,
        ),
        SizedBox(height: 30.h),
        Expanded(
          child: SizedBox(
            child: ListView.builder(
              itemCount: answers.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 7),
                  child: QuizAnswerItem(
                    answer: answers[index],
                    questionIndex: questionIndex,
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

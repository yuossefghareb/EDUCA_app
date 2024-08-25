import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/utils/styles.dart';
import 'package:field_training_app/student_features/quiz/presentation/view_model/select_answer_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuizAnswerItem extends StatelessWidget {
  const QuizAnswerItem({
    super.key,
    required this.answer,
    required this.questionIndex,
  });

  final String answer;
  final int questionIndex;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: kSplashColor,
      borderRadius: BorderRadius.circular(6.r),
      onTap: () {
        context.read<SelectAnswerCubit>().setAnswer(questionIndex, answer);
      },
      child: BlocBuilder<SelectAnswerCubit, List<String>>(
        builder: (context, state) {
          return Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
            width: double.infinity,
            decoration: BoxDecoration(
                border: state[questionIndex] == answer
                    ? Border.all(color: kPrimaryColor, width: 1.3)
                    : Border.all(color: Colors.grey[400]!),
                borderRadius: state[questionIndex] == answer
                    ? BorderRadius.circular(8.r)
                    : BorderRadius.circular(6.r),
                color: state[questionIndex] == answer
                    ? kSplashDarkerColor
                    : Colors.white),
            child: Text(
              answer,
              style: Styles.textStyle16.copyWith(
                  color: state[questionIndex] == answer
                      ? kPrimaryColor
                      : Colors.black),
              textDirection: TextDirection.rtl,
            ),
          );
        },
      ),
    );
  }
}

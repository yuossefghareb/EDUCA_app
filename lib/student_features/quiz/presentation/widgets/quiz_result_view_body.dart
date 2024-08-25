import 'package:field_training_app/Core/utils/styles.dart';
import 'package:field_training_app/Core/widgets/custom_button.dart';
import 'package:field_training_app/Core/widgets/pop_icon_button.dart';
import 'package:field_training_app/student_features/quiz/presentation/widgets/quiz_degree.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../Core/utils/routes.dart';

class QuizResultViewBody extends StatelessWidget {
  const QuizResultViewBody(
      {super.key,
      required this.numberOfQuestions,
      required this.numberOfCorrectAnswers,
      required this.quizID});

  final int numberOfQuestions;
  final int numberOfCorrectAnswers;
  final int quizID;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomPopIconButton(),
              Text(
                "نتيجة الاختبار",
                style: Styles.textStyle22,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          const SizedBox(height: 20),
          numberOfCorrectAnswers * 2 >= numberOfQuestions
              ? Lottie.asset(
                  'assets/animation/done.json',
                  height: 300.h,
                  frameRate: FrameRate.max,
                )
              : Lottie.asset(
                  'assets/animation/failure.json',
                  height: 300.h,
                  frameRate: FrameRate.max,
                ),
          SizedBox(height: 30.h),
          numberOfCorrectAnswers * 2 >= numberOfQuestions
              ? Text(
                  "تهانينا لك , لقد نجحت في الاختبار",
                  style: Styles.textStyle18,
                  textAlign: TextAlign.end,
                )
              : Text(
                  "للأسف , لقد رسبت في الاختبار",
                  style: Styles.textStyle18,
                  textAlign: TextAlign.end,
                ),
          SizedBox(height: 35.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              QuizDegree(
                  left: ((numberOfCorrectAnswers / numberOfQuestions) * 100)
                      .toInt(),
                  right: 100),
              QuizDegree(
                  left: numberOfCorrectAnswers, right: numberOfQuestions),
            ],
          ),
          Expanded(child: SizedBox(height: 30.h)),
          CustomButton(
              text: "اعادة الاختبار مرة اخرى",
              onpressed: () {
                Navigator.pushReplacementNamed(context, Routes.quizViewRoute,
                    arguments: quizID);
              }),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}

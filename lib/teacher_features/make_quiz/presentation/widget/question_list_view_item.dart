// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:field_training_app/Core/utils/app_services.dart';
import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/utils/routes.dart';
import 'package:field_training_app/Core/widgets/custom_cherry_toast.dart';
import 'package:field_training_app/teacher_features/make_quiz/data/repos/add_quiz_repo/add_quzi_repo_impelement.dart';
import 'package:field_training_app/teacher_features/make_quiz/presentation/views_model/add_question_cubit/add_question_cubit.dart';
import 'package:field_training_app/teacher_features/make_quiz/presentation/widget/custom_answers_question.dart';
import 'package:flutter/material.dart';

import 'package:field_training_app/Core/models/question_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class QuestionListViewItem extends StatelessWidget {
  QuestionListViewItem({
    super.key,
    required this.questionModel,
    required this.cnt,
  });
  int cnt;
  final QuestionModel questionModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          "$cnt : ${questionModel.question}",
          style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          textDirection: TextDirection.rtl,
        ),
        const SizedBox(height: 10),
        CustomAnswersQuestion(
          charAnswer: "A",
          answer: questionModel.option1,
          correctAnswer: questionModel.correctAnswer,
          idex: 0,
        ),
        CustomAnswersQuestion(
          charAnswer: "B",
          answer: questionModel.option2,
          correctAnswer: questionModel.correctAnswer,
          idex: 1,
        ),
        CustomAnswersQuestion(
          charAnswer: "C",
          answer: questionModel.option3,
          correctAnswer: questionModel.correctAnswer,
          idex: 2,
        ),
        CustomAnswersQuestion(
          charAnswer: "D",
          answer: questionModel.option4,
          correctAnswer: questionModel.correctAnswer,
          idex: 3,
        ),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(kPrimaryColor),
                ),
                child: const Text(
                  "تعديل",
                  style: TextStyle(color: Colors.white),
                )),
            const SizedBox(width: 15),
            BlocProvider(
              create: (context) =>
                  AddQuestionCubit(getIt<AddQuizRepoImplement>()),
              child: BlocConsumer<AddQuestionCubit, AddQuestionState>(
                listener: (context, state) {
                  if (state is DeleteQuestionSuccess) {
                    successCherryToast(context, 'تم حذف السؤال بنجاح', 'تم');
                    Navigator.pushReplacementNamed(
                        context, Routes.showQuizViewRoute,
                        arguments: questionModel.quizId);
                  } else {
                    errorCherryToast(context, 'حدث خطا', 'خطا');
                   
                  }
                },
                builder: (context, state) {
                  return ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(kPrimaryColor),
                    ),
                    onPressed: () {
                      BlocProvider.of<AddQuestionCubit>(context)
                          .deleteQuestion(questionId: questionModel.quizId);
                    },
                    child: const Text("حذف",
                        style: TextStyle(color: Colors.white)),
                  );
                },
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        const Divider(),
      ],
    );
  }
}

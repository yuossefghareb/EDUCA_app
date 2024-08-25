import 'package:field_training_app/Core/models/question_model.dart';
import 'package:field_training_app/Core/utils/routes.dart';
import 'package:field_training_app/Core/widgets/custom_button.dart';
import 'package:field_training_app/teacher_features/make_quiz/presentation/widget/show_quiz_listview_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowQuizViewBody extends StatelessWidget {
  const ShowQuizViewBody(
      {super.key,
      required this.allquestionList,
      required this.quizId,
      required this.subjectId,
      required this.titleQuiz});
  final List<QuestionModel> allquestionList;
  final int quizId;
  final int subjectId;
  final String titleQuiz;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
       
        SizedBox(height: 10.h),
        Expanded(
          child: ShowQuizListViewBuider(allquestionList: allquestionList),
        ),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomButton(
              onpressed: () {
                Navigator.pushNamed(context, Routes.createQuizViewRoute,
                    arguments: {
                      'quizId': quizId,
                      'subjectId': subjectId,
                      'titleQuiz': titleQuiz,
                    });
              },
              text: "اضافة سؤال",
            )),
      ],
    );
  }
}

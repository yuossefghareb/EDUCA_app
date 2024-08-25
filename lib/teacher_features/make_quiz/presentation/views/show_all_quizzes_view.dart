import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/utils/styles.dart';
import 'package:field_training_app/Core/widgets/pop_icon_button.dart';
import 'package:field_training_app/teacher_features/make_quiz/presentation/widget/show_all_quizzes_view_body.dart';
import 'package:flutter/material.dart';

class ShowAllQuizzesView extends StatelessWidget {
  const ShowAllQuizzesView({super.key, required this.subjectId});
  final int subjectId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "الاختبارات",
          style: Styles.textStyle20
              .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const CustomPopIconButton(
            backgroundColor: Colors.white70,
            radius: 18,
          ),
        ),
      ),
      body: SafeArea(
          child: ShowAllQuizzesViewBody(
        subjectId: subjectId,
      )),
    );
  }
}

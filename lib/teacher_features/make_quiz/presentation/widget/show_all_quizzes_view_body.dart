import 'package:field_training_app/teacher_features/make_quiz/presentation/widget/show_all_quizes_listview_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ShowAllQuizzesViewBody extends StatelessWidget {
  const ShowAllQuizzesViewBody({super.key, required this.subjectId});
  final int subjectId;
  @override
  Widget build(BuildContext context) {
    return ShowAllQuizzesListViewBuilder(
      subjectId: subjectId,
    );
  }
}

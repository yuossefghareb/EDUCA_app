import 'package:field_training_app/Core/models/question_model.dart';
import 'package:field_training_app/teacher_features/make_quiz/presentation/widget/question_list_view_item.dart';
import 'package:flutter/material.dart';

class ShowQuizListViewBuider extends StatelessWidget {
  const ShowQuizListViewBuider({
    super.key,
    required this.allquestionList,
  });

  final List<QuestionModel> allquestionList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: allquestionList.isEmpty
          ? const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.question_answer_outlined,
                  size: 50,
                ),
                SizedBox(height: 10),
                Text(
                  'الاختبار فارغ   \nاضف اسئلة',
                  style: TextStyle(fontSize: 24),
                ),
              ],
            )
          : ListView.builder(
              itemCount: allquestionList.length,
              itemBuilder: (context, index) {
                return QuestionListViewItem(
                  questionModel: allquestionList[index],
                  cnt: index + 1,
                );
              },
            ),
    );
  }
}

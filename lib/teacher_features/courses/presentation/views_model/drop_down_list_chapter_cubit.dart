import 'package:field_training_app/Core/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DropDownListChapterCubit extends Cubit<String> {
  DropDownListChapterCubit() : super("اختر الدرس");

  void changeIndexDropDownListChapter({
    required String ch,
    bool ispusing = false,
    BuildContext? context,
    int? subjectId,
    List<String>? chaptersN,
    Map<String, int>? chapterIndx,
    int? chapterId,
  }) {
    if (ispusing) {
      Navigator.pushReplacementNamed(
        context!,
        Routes.courseEditViewRoute,
        arguments: {
          "namech": ch,
          "subjectId": subjectId,
          "chaptersN": chaptersN,
          "chapterIndx": chapterIndx,
          "chapterId": chapterId
        },
      );
    }
    emit(ch);
  }
}

import 'package:field_training_app/Core/utils/app_services.dart';
import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/utils/styles.dart';
import 'package:field_training_app/Core/widgets/pop_icon_button.dart';
import 'package:field_training_app/teacher_features/courses/data/repos/chapter_files_repo/chapter_files_repo_implement.dart';
import 'package:field_training_app/teacher_features/courses/presentation/views/widgets/course_edit_view_body.dart';

import 'package:field_training_app/teacher_features/courses/presentation/views_model/drop_down_list_chapter_cubit.dart';
import 'package:field_training_app/teacher_features/courses/presentation/views_model/get_all_chapters_cubit/get_all_chapters_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourseEditView extends StatelessWidget {
  const CourseEditView(
      {super.key,
      required this.subjectId,
      required this.chaptersN,
      required this.chapterIndx,
      required this.chapterId,
      required this.namech});
  final int subjectId;
  final List<String> chaptersN;
  final Map<String, int> chapterIndx;
  final int chapterId;
  final String namech;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: Text(
            'تعديل المادة',
            style: Styles.textStyle20
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const CustomPopIconButton(
              radius: 18,
              backgroundColor: Colors.white70,
            ),
          )),
      body: SafeArea(
          child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => DropDownListChapterCubit(),
          ),
          BlocProvider(
            create: (context) =>
                GetAllChaptersCubit(getIt.get<ChapterFilesRepoImplement>()),
          ),
        ],
        child: CourseEditViewBody(
          namech: namech,
          chapterId: chapterId,
          chapterIndex: chapterIndx,
          chaptersN: chaptersN,
          subjectId: subjectId,
        ),
      )),
    );
  }
}

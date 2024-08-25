import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:field_training_app/Core/widgets/custom_cherry_toast.dart';
import 'package:field_training_app/teacher_features/courses/data/models/chapter_model.dart';
import 'package:field_training_app/teacher_features/courses/presentation/views/widgets/chapter_item.dart';
import 'package:field_training_app/teacher_features/courses/presentation/views_model/get_all_chapters_cubit/get_all_chapters_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClassesAndSubClassesListViews extends StatelessWidget {
  const ClassesAndSubClassesListViews({
    super.key,
    required this.chaptersList,
  });

  final List<ChapterModel> chaptersList;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: chaptersList.length,
        (context, index) {
          return BlocConsumer<GetAllChaptersCubit, GetAllChaptersState>(
            listener: (context, state) {
              if (state is DeleteChapterSuccess) {
                successCherryToast(context, 'تم حذف الفصل بنجاح', 'تم');
                Navigator.pop(context);
                // Navigator.pushReplacementNamed(
                //   context,
                //   Routes.courseDetailsTeacherViewRoute,
                //   arguments: chaptersList[index].subjectId,
                // );
              } else if (state is DeleteChapterFailure) {
                Navigator.pop(context);
                errorCherryToast(context, 'حدث خطا', 'خطا');
              }
            },
            builder: (context, state) {
              return InkWell(
                onLongPress: () {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.infoReverse,
                    animType: AnimType.topSlide,
                    title: 'تنبيه',
                    desc: 'هل تريد حذف هذا الفصل  ؟',
                    btnCancelOnPress: () {
                      Navigator.pop(context);
                    },
                    btnOkOnPress: () {
                      BlocProvider.of<GetAllChaptersCubit>(context)
                          .deleteChapter(chapterId: chaptersList[index].id!);
                    },
                    btnOkText: 'نعم',
                    btnCancelText: 'لا',
                  ).show();
                },
                child: ChapterItem(
                  index: index,
                  chapterModel: chaptersList[index],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/utils/routes.dart';
import 'package:field_training_app/teacher_features/courses/data/models/chapter_model.dart';
import 'package:field_training_app/teacher_features/courses/presentation/views_model/get_all_chapters_cubit/get_all_chapters_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChapterItem extends StatelessWidget {
  final int index;
 

  const ChapterItem(
      {super.key,
      required this.index,
      
      required this.chapterModel});

  final ChapterModel chapterModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            chapterModel.name ?? "الدرس ${index + 1}",
            textDirection: TextDirection.rtl,
          ),
          leading: const Icon(
                  Icons.edit,
                  color: kPrimaryColor,
                ),
          onTap: () {
            Navigator.pushNamed(context, Routes.courseEditViewRoute,
                arguments: {
                  "subjectId": chapterModel.subjectId,
                  "chaptersN": context.read<GetAllChaptersCubit>().chapterNames,
                  "chapterIndx":
                      context.read<GetAllChaptersCubit>().chapterIndx,
                  "chapterId": chapterModel.id,
                  "namech": chapterModel.name
                });

            // context.read<ShowSubClassesCubit>().toggleExpansion(index);
          },
        ),
        // if (isExpanded)
        //   InkWell(
        //     onTap: () {
        //       Navigator.pushNamed(context, Routes.courseEditViewRoute);
        //     },
        //     child: Padding(
        //       padding: const EdgeInsets.only(
        //         left: 25,
        //       ),
        //       child: ListView.builder(
        //         physics: const NeverScrollableScrollPhysics(),
        //         shrinkWrap: true,
        //         itemCount: 4,
        //         itemBuilder: (context, subIndex) {
        //           return ListTile(title: Text("الدرس ${subIndex + 1}"));
        //         },
        //       ),
        //     ),
        //   )
      ],
    );
  }
}

import 'package:field_training_app/Core/widgets/custom_failure_widget.dart';
import 'package:field_training_app/Core/widgets/custom_loading_widget.dart';
import 'package:field_training_app/student_features/lessons/presentation/view_model/cubit/lessons_cubit.dart';
import 'package:field_training_app/student_features/lessons/presentation/widgets/convert_to_pdf_function.dart';
import 'package:field_training_app/student_features/lessons/presentation/widgets/detect_file_type_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'lesson_detail_item.dart';

class LessonDetailsViewBody extends StatelessWidget {
  const LessonDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: BlocBuilder<LessonsCubit, LessonsState>(
        builder: (context, state) {
          if (state is LessonItemsSuccess) {
            return state.lessonItems.isEmpty ? const Center(child: Text('لا يوجد بيانات')) : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 0,
                crossAxisSpacing: 16,
              ),
              itemCount: state.lessonItems.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: LessonDetailItem(
                    type: fileTypeDetect(
                    contentType: state.lessonItems[index].contentType!),
                    name: state.lessonItems[index].fileName!,
                    ontap: () {
                      convertToPDF(
                          base64Content: state.lessonItems[index].fileContent!,
                          fileName: state.lessonItems[index].fileName!);
                    },
                  ),
                );
              },
            );
          } else if (state is LessonItemsFailure) {
            return CustomFailureWidget(errMessage: state.errMessage);
          }
          return const CustomLoadingWidget();
        },
      ),
    );
  }
}

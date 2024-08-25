import 'package:field_training_app/Core/utils/styles.dart';
import 'package:field_training_app/Core/widgets/custom_failure_widget.dart';
import 'package:field_training_app/Core/widgets/custom_loading_widget.dart';
import 'package:field_training_app/student_features/courses/presentation/widgets/my_courses_item.dart';
import 'package:field_training_app/student_features/teacher_details_and_subjects/presentation/view_model/cubit/teacher_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TeacherSubjectsViewBody extends StatelessWidget {
  const TeacherSubjectsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: BlocBuilder<TeacherDetailsCubit, TeacherDetailsState>(
        builder: (context, state) {
          if (state is TeacherSubjectsSuccess) {
            return state.subjectList.isEmpty
                ? Center(
                    child: Text(
                    'لا يوجد مواد',
                    style: Styles.textStyle16,
                  ))
                : ListView.builder(
                    itemCount: state.subjectList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 14, bottom: 5),
                        child: MyCoursesItem(
                          subjectModel: state.subjectList[index],
                        ),
                      );
                    },
                  );
          } else if (state is TeacherSubjectsFailure) {
            return CustomFailureWidget(errMessage: state.errMessage);
          }
          return const CustomLoadingWidget();
        },
      ),
    );
  }
}

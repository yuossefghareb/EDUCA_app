import 'package:field_training_app/Core/widgets/custom_loading_widget.dart';
import 'package:field_training_app/teacher_features/courses/presentation/views/widgets/enrolled_student_list_view_item.dart';
import 'package:field_training_app/teacher_features/courses/presentation/views_model/get_enrolled_student_cubit/get_enrolled_student_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EnrolledStudentsViewBody extends StatelessWidget {
  const EnrolledStudentsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetEnrolledStudentCubit, GetEnrolledStudentState>(
      builder: (context, state) {
        if (state is GetEnrolledStudentFailure) {
          return Center(
            child: Text(
              state.message,
              style: const TextStyle(
                fontSize: 25,
              ),
              textAlign: TextAlign.center,
            ),
          );
        } else if (state is GetEnrolledStudentSuccess) {
          return ListView.builder(
            itemCount: state.enrolledStudentList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: EnrolledStudentListViewItem(
                  enrolledStudent: state.enrolledStudentList[index],
                ),
              );
            },
          );
        } else {
          return const CustomLoadingWidget();
        }
      },
    );
  }
}

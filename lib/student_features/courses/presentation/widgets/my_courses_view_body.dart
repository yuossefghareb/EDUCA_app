import 'package:field_training_app/Core/widgets/custom_failure_widget.dart';
import 'package:field_training_app/Core/widgets/custom_loading_widget.dart';
import 'package:field_training_app/student_features/courses/presentation/widgets/my_courses_item.dart';
import 'package:field_training_app/student_features/enrollment/presentation/view_model/cubit/enrollment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCoursesViewBody extends StatelessWidget {
  const MyCoursesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: BlocBuilder<EnrollmentCubit, EnrollmentState>(
        builder: (context, state) {
          if (state is EnrolledSubjectsSuccess) {
            return ListView.builder(
              itemCount: state.enrolledSubjects.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 6),
                  child: MyCoursesItem(
                    subjectModel: state.enrolledSubjects[index],
                  ),
                );
              },
            );
          } else if (state is EnrolledSubjectsFailure) {
            return const CustomFailureWidget(errMessage: 'لا يوجد مواد دراسية');
          }
          return const CustomLoadingWidget();
        },
      ),
    );
  }
}

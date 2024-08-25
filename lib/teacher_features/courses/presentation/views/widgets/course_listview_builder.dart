import 'package:field_training_app/Core/utils/routes.dart';
import 'package:field_training_app/Core/utils/styles.dart';
import 'package:field_training_app/Core/widgets/custom_loading_widget.dart';
import 'package:field_training_app/teacher_features/courses/presentation/views/widgets/course_lisview_item.dart';
import 'package:field_training_app/teacher_features/courses/presentation/views_model/get_all_courses_cubit/get_all_courses_teacher_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourseListViewBuider extends StatelessWidget {
  const CourseListViewBuider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllCoursesTeacherCubit, GetAllCoursesTeacherState>(
      builder: (context, state) {
        if (state is GetAllCoursesTeacherSuccess) {
          return ListView.builder(
            itemCount: state.courses.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: CourseListViewItem(
                  course: state.courses[index],
                ),
              );
            },
          );
        } else if (state is GetAllCoursesTeacherFailure) {
          return InkWell(
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(Routes.createClassViewRoute);
            },
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.subject_outlined, color: Colors.grey),
                  const SizedBox(height: 16.0),
                  Text(
                    "No courses available \n  add new course",
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                    style: Styles.textStyle18.copyWith(color: Colors.grey),
                  ),
                ],
              ),
            ),
          );
        }
        return const CustomLoadingWidget();
      },
    );
  }
}

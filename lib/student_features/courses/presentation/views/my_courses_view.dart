import 'package:field_training_app/student_features/courses/presentation/widgets/my_courses_view_body.dart';
import 'package:flutter/material.dart';

class MyCoursesView extends StatelessWidget {
  const MyCoursesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: MyCoursesViewBody()),
    );
  }
}

import 'package:field_training_app/teacher_features/profile_teacher/presentation/widgets/profile_teacher_view_body.dart';
import 'package:flutter/material.dart';

class TeacherProfileView extends StatelessWidget {
  const TeacherProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: ProfileTeacherViewBody()),
    );
  }
}

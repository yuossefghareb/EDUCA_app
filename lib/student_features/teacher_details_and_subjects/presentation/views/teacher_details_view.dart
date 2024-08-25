import 'package:flutter/material.dart';

import '../widgets/teacher_details_view_body.dart';

class TeacherDetailsView extends StatelessWidget {
  const TeacherDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: TeacherDetailsViewBody()),
    );
  }
}

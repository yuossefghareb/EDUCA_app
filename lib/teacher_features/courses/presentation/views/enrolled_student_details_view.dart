import 'package:field_training_app/student_features/enrollment/data/models/all_students_enrolled_in_spec_subject_model/st_dto.dart';
import 'package:field_training_app/teacher_features/courses/presentation/views/widgets/enrolled_student_details_viewbody.dart';
import 'package:flutter/material.dart';

class EnrolledStudentDetailsView extends StatelessWidget {
  const EnrolledStudentDetailsView({super.key, required this.stDto});

  final StDto stDto;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EnrolledStudentDetailsViewBody(
        stDto: stDto,
      ),
    );
  }
}

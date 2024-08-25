import 'package:field_training_app/Core/utils/routes.dart';
import 'package:field_training_app/Core/utils/styles.dart';
import 'package:field_training_app/student_features/enrollment/data/models/all_students_enrolled_in_spec_subject_model/all_students_enrolled_in_spec_subject_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EnrolledStudentListViewItem extends StatelessWidget {
  const EnrolledStudentListViewItem({super.key, required this.enrolledStudent});
  final AllStudentsEnrolledInSpecSubjectModel enrolledStudent;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.enrolledStudentDetailsRoute,
            arguments: enrolledStudent.stDto);
      },
      child: ListTile(
        title: Text(
          "${enrolledStudent.stDto!.firstName}  ${enrolledStudent.stDto!.lastName}",
          textAlign: TextAlign.right,
        ),
        subtitle: Text(
          'تاريخ التسجيل ${DateFormat.yMd().format(DateTime.now())}',
          textAlign: TextAlign.right,
          style: Styles.textStyle12,
        ),
        trailing: CircleAvatar(
          backgroundImage:
              NetworkImage(enrolledStudent.stDto!.profileImageUrl ?? ""),
        ),
      ),
    );
  }
}

import 'package:dartz/dartz.dart';
import 'package:field_training_app/Core/models/subject_model.dart';
import 'package:field_training_app/student_features/enrollment/data/models/all_student_enrolled_subjects_model.dart';

import '../../../../Core/api_services/failure.dart';
import '../models/all_students_enrolled_in_spec_subject_model/all_students_enrolled_in_spec_subject_model.dart';

abstract class EnrollmentRepo {
  Future<Either<Failure, String>> studentEnrollment(
      {required int studentID, required int subjectID});

  Future<Either<Failure, List<AllStudentEnrolledSubjectsModel>>>
      allStudentEnrolledSubjects({required int studentID});

  Future<Either<Failure, SubjectModel>> getSubjectByID(
      {required int subjectID});
  Future<Either<Failure, List<AllStudentsEnrolledInSpecSubjectModel>>>
      allStudentsEnrolledInSpecSubject({required int subjectID});
}

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:field_training_app/Core/api_services/api_service.dart';
import 'package:field_training_app/Core/api_services/end_points.dart';

import 'package:field_training_app/Core/api_services/failure.dart';
import 'package:field_training_app/Core/models/subject_model.dart';
import 'package:field_training_app/student_features/enrollment/data/models/all_student_enrolled_subjects_model.dart';
import 'package:field_training_app/student_features/enrollment/data/models/all_students_enrolled_in_spec_subject_model/all_students_enrolled_in_spec_subject_model.dart';

import 'enrollment_repo.dart';

class EnrollmentRepoImplement implements EnrollmentRepo {
  final ApiServices apiServices;

  EnrollmentRepoImplement({required this.apiServices});
  @override
  Future<Either<Failure, String>> studentEnrollment(
      {required int studentID, required int subjectID}) async {
    try {
      var data = await apiServices.post(
          endPoint: EndPoint.studentEnrollment(studentID, subjectID));

      return data is Map<String, dynamic>
          ? right('تم تسجيل المادة بنجاح')
          : Left(ServerFailure('أنت بالفعل مسجل هذا المادة'));
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure('أنت بالفعل مسجل هذا المادة'));
    }
  }

  @override
  Future<Either<Failure, List<AllStudentEnrolledSubjectsModel>>>
      allStudentEnrolledSubjects({required int studentID}) async {
    try {
      var data = await apiServices.get(
          endPoint: EndPoint.allstudentEnrolledSubjects(studentID));

      List<AllStudentEnrolledSubjectsModel> subjects = [];
      for (var element in data) {
        subjects.add(AllStudentEnrolledSubjectsModel.fromJson(element));
      }
      return right(subjects);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, SubjectModel>> getSubjectByID(
      {required int subjectID}) async {
    try {
      var data =
          await apiServices.get(endPoint: EndPoint.getSubjectByID(subjectID));

      SubjectModel subjectModel = SubjectModel.fromJson(data);

      return right(subjectModel);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<AllStudentsEnrolledInSpecSubjectModel>>>
      allStudentsEnrolledInSpecSubject({required int subjectID}) async {
    try {
      var data = await apiServices.get(
          endPoint: EndPoint.allStudentEnrolledInSpecificSubject(subjectID));

      List<AllStudentsEnrolledInSpecSubjectModel> studentsList = [];
      for (var element in data) {
        studentsList
            .add(AllStudentsEnrolledInSpecSubjectModel.fromJson(element));
      }

      return right(studentsList);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}

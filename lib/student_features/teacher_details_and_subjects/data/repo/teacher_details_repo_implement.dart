import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:field_training_app/Core/api_services/api_service.dart';
import 'package:field_training_app/Core/api_services/end_points.dart';
import 'package:field_training_app/Core/models/subject_model.dart';

import '../../../../Core/api_services/failure.dart';
import '../../../../Core/models/teacher_model.dart';
import 'teacher_details_repo.dart';

class TeacherDetailsRepoImplement implements TeacherDetailsRepo {
  final ApiServices apiServices;
  TeacherDetailsRepoImplement({required this.apiServices});

  @override
  Future<Either<Failure, TeacherModel>> getTeacherData(
      {required int teacherID}) async {
    try {
      var data = await apiServices.get(
        endPoint: EndPoint.getTeacherById(teacherID),
      );
      TeacherModel teacherModel = TeacherModel.fromJson(data);
      return right(teacherModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<SubjectModel>>> getTeacherSubjects(
      {required int teacherID}) async {
    try {
      var data = await apiServices.get(
        endPoint: EndPoint.allCoursesWithTeacherId(teacherID),
      );
      List<SubjectModel> subjectList = [];
      for (var element in data) {
        subjectList.add(SubjectModel.fromJson(element));
      }

      return right(subjectList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}

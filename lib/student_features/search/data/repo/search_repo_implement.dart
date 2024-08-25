import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:field_training_app/Core/api_services/api_service.dart';
import 'package:field_training_app/Core/api_services/failure.dart';
import 'package:field_training_app/Core/models/teacher_model.dart';
import '../../../../Core/api_services/end_points.dart';
import '../../../../Core/models/subject_model.dart';
import 'search_repo.dart';

class SearchRepoImplement implements SearchRepo {
  ApiServices apiServices;
  SearchRepoImplement({required this.apiServices});

  @override
  Future<Either<Failure, List<TeacherModel>>> getSearchByTeacherName(
      String? teacherName) async {
    try {
      var data = await apiServices.get(
        endPoint: EndPoint.searchByTeacherOrSubject(teacherName),
      );

      List<TeacherModel> searchedList = [];
      if (data.first.containsKey('email')) {
        for (var item in data) {
          searchedList.add(TeacherModel.fromJson(item));
        }
      }
      return right(searchedList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<SubjectModel>>> getSearchBySubjectName(
      String? subjectName) async {
    try {
      var data = await apiServices.get(
        endPoint: EndPoint.searchByTeacherOrSubject(subjectName),
      );
      List<SubjectModel> searchedList = [];
      if (data.first.containsKey('subjName')) {
        for (var item in data) {
          searchedList.add(SubjectModel.fromJson(item));
        }
      }

      return right(searchedList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<SubjectModel>>> getSearchByTeachersInGovernate(
      String subjectName, String governate) async {
    try {
      var data = await apiServices.get(
        endPoint: EndPoint.searchByTeachersInGovernate(subjectName, governate),
      );

      List<SubjectModel> searchedList = [];
      if (data.first.containsKey('subjName')) {
        for (var item in data) {
          searchedList.add(SubjectModel.fromJson(item));
        }
      }
      return right(searchedList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}

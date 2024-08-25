import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:field_training_app/Core/api_services/api_service.dart';
import 'package:field_training_app/Core/api_services/end_points.dart';
import 'package:field_training_app/Core/api_services/failure.dart';
import 'package:field_training_app/Core/models/subject_model.dart';
import 'package:field_training_app/student_features/home/data/repo/home_repo.dart';

class HomeRepoImplement implements HomeRepo {
  final ApiServices apiServices;

  HomeRepoImplement({required this.apiServices});
  @override
  Future<Either<Failure, List<SubjectModel>>> getAllSubject() async {
    try {
      var data = await apiServices.get(endPoint: EndPoint.subject);
      List<SubjectModel> subjectList = [];
      for (var element in data) {
        subjectList.add(SubjectModel.fromJson(element));
      }
      return (right(subjectList));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}

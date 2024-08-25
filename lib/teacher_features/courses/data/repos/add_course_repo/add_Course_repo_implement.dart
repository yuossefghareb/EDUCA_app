// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:field_training_app/Core/api_services/api_service.dart';
import 'package:field_training_app/Core/api_services/end_points.dart';
import 'package:field_training_app/Core/api_services/failure.dart';
import 'package:field_training_app/cache/cache_helper.dart';

import 'package:field_training_app/teacher_features/courses/data/models/course_model.dart';
import 'package:field_training_app/teacher_features/courses/data/repos/add_course_repo/add_course_repo.dart';

class AddCourseRepoImplement implements AddCourseRepo {
  final ApiServices apiServices;

  AddCourseRepoImplement({required this.apiServices});
  @override
  Future<Either<Failure, CourseModel>> addCourse({
    required String subjectName,
    required int pricePerHour,
    required String level,
    required int trem,
    required bool isOnline,
    required bool isActive,
    required int totalPrice,
    required String describtion,
  }) async {
    try {
      var data = await apiServices.post(
        endPoint: EndPoint.subject,
        data: {
          ApiKey.teacherId: CacheHelper.getData(key: ApiKey.id),
          ApiKey.subjectName: subjectName,
          ApiKey.level: level,
          ApiKey.describtion: describtion,
          ApiKey.pricePerHour: pricePerHour,
          ApiKey.addingTime: "2024-05-11T11:15:58.661",
          ApiKey.term: trem,
          ApiKey.isActive: isActive,
          ApiKey.isOnline: isOnline,
          ApiKey.tolalPrice: totalPrice,
        },
      );

      CourseModel courseModel = CourseModel.fromJson(data);

      return right(courseModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure("حدث خطأ ما"));
    }
  }

  @override
  @override
  Future<Either<Failure, CourseModel>> updateCourse(
      {required String subjectName,
      required int pricePerHour,
      required String level,
      required String describtion}) {
    throw UnimplementedError();
  }
}

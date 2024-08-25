import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:field_training_app/Core/api_services/api_service.dart';
import 'package:field_training_app/Core/api_services/end_points.dart';
import 'package:field_training_app/Core/api_services/failure.dart';
import 'package:field_training_app/teacher_features/courses/data/models/course_model.dart';
import 'package:field_training_app/teacher_features/courses/data/repos/course_repo/course_repo.dart';

class CourseRepoImplement implements CourseRepo {
  final ApiServices apiServices;

  CourseRepoImplement({required this.apiServices});

  @override
  Future<Either<Failure, List<CourseModel>>> getCourses({
    required int teacherId,
  }) async {
    try {
      var data = await apiServices.get(
        endPoint: EndPoint.allCoursesWithTeacherId(teacherId),
      );
      List<CourseModel> courseList = [];
      for (var item in data) {
        courseList.add(CourseModel.fromJson(item));
      }
      return right(courseList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> deleteCourse({required int subjectId}) async {
    try {
      var data = await apiServices.delete(
        EndPoint.deleteSubjectWithTeacherId(subjectId),
      );
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> updateCourse(
      {required CourseModel courseModel}) async {
    // print("courseModel: ${courseModel.subjectId}");
    // print("courseModel: ${courseModel.teacherId}");
    // print("courseModel: ${courseModel.subjectName}");
    // print("courseModel: ${courseModel.level}");
    // print("courseModel: ${courseModel.describtion}");
    // print("courseModel: ${courseModel.pricePerHour}");
    // print("courseModel: ${courseModel.teacherId}");
   // print("courseModel: ${courseModel.isActive}");
    // print("courseModel: ${courseModel.addingTime}");
    // print("courseModel: ${courseModel.isOnline}");
    try {
      var response = await apiServices.put(
        endPoint: EndPoint.updateCourseWithTeacherId(
          courseModel.subjectId!,
        ),
        data: {
          ApiKey.subjectName: courseModel.subjectName ?? "",
          ApiKey.level: courseModel.level ?? "",
          ApiKey.description: courseModel.describtion ?? "",
          ApiKey.subjectId: courseModel.subjectId ?? "",
          ApiKey.pricePerHour: courseModel.pricePerHour ?? "",
          ApiKey.teacherId: courseModel.teacherId ?? "",
          ApiKey.isActive: courseModel.isActive == true ? false : true,
          ApiKey.addingTime: courseModel.addingTime ?? "",
          "Describtion": courseModel.describtion ?? "",
          ApiKey.isOnline: true,
        },
      );

      return right(response);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}

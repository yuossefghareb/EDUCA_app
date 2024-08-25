import 'package:dartz/dartz.dart';
import 'package:field_training_app/Core/api_services/failure.dart';
import 'package:field_training_app/teacher_features/courses/data/models/course_model.dart';

abstract class AddCourseRepo {
  Future<Either<Failure, CourseModel>> addCourse({
    required String subjectName,
    required int pricePerHour,
    required String level,
    required String describtion,
    required int trem,
    required bool isOnline,
    required bool isActive,
    required int totalPrice,
  });

  Future<Either<Failure, CourseModel>> updateCourse({
    required String subjectName,
    required int pricePerHour,
    required String level,
    required String describtion,
  });
}

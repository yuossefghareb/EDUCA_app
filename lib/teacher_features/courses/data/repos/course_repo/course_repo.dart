import 'package:dartz/dartz.dart';
import 'package:field_training_app/Core/api_services/failure.dart';
import 'package:field_training_app/teacher_features/courses/data/models/course_model.dart';

abstract class CourseRepo {
  Future<Either<Failure, List<CourseModel>>> getCourses({
    required int teacherId,
  });

  Future<Either<Failure, String>> deleteCourse({
    required int subjectId,
  });

  Future<Either<Failure, String>> updateCourse({
    required CourseModel courseModel,
  });
}

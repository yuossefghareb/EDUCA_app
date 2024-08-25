import 'package:dartz/dartz.dart';
import 'package:field_training_app/Core/api_services/failure.dart';

import '../../../../Core/models/subject_model.dart';
import '../../../../Core/models/teacher_model.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<TeacherModel>>> getSearchByTeacherName(
      String? teacherName);
  Future<Either<Failure, List<SubjectModel>>> getSearchBySubjectName(
      String? subjectName);
  Future<Either<Failure, List<SubjectModel>>> getSearchByTeachersInGovernate(
      String subjectName, String governate);
}

import 'package:dartz/dartz.dart';
import 'package:field_training_app/Core/api_services/failure.dart';

import '../../../../Core/models/subject_model.dart';
import '../../../../Core/models/teacher_model.dart';

abstract class TeacherDetailsRepo {
  Future<Either<Failure, TeacherModel>> getTeacherData(
      {required int teacherID});
  Future<Either<Failure, List<SubjectModel>>> getTeacherSubjects(
      {required int teacherID});
}

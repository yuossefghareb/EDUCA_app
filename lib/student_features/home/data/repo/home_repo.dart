import 'package:dartz/dartz.dart';
import 'package:field_training_app/Core/api_services/failure.dart';
import 'package:field_training_app/Core/models/subject_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<SubjectModel>>> getAllSubject();
}

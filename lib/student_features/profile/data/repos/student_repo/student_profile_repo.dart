import 'package:dartz/dartz.dart';
import 'package:field_training_app/Core/api_services/failure.dart';
import 'package:field_training_app/student_features/profile/data/models/student_model.dart';
import 'package:image_picker/image_picker.dart';

abstract class StudentProfileRepo {
  Future<Either<Failure, StudentModel>> getStudentData({
    required String endPoint,
  });
  Future<Either<Failure, String>> updateStudentData({
    required String endPoint,
    String? firstName,
    String? lastName,
    String? phone,
    String? password,
    String? studentLevel,
    XFile? image,
  });
}

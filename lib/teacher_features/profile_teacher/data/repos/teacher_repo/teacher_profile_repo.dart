import 'package:dartz/dartz.dart';
import 'package:field_training_app/Core/api_services/failure.dart';
import 'package:field_training_app/teacher_features/profile_teacher/data/models/teacher_model.dart';

import 'package:image_picker/image_picker.dart';

abstract class TeacherProfileRepo {
  Future<Either<Failure, TeacherModel>> getTeacherData({
    required String endPoint,
  });
  Future<Either<Failure, String>> updateTeacherData({
    required String endPoint,
    String? firstName,
    String? lastName,
    String? phone,
    String? password,
    String? address,
    String? governorate,
    XFile? image,
  });
}

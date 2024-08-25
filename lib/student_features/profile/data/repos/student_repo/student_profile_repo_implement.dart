import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:field_training_app/Core/api_services/api_service.dart';
import 'package:field_training_app/Core/api_services/failure.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../Core/api_services/end_points.dart';

import '../../../../auth/helper/upload_image_to_api.dart';
import '../../models/student_model.dart';
import 'student_profile_repo.dart';

class StudentProfileRepoImplement implements StudentProfileRepo {
  final ApiServices apiServices;

  StudentProfileRepoImplement({required this.apiServices});
  @override
  Future<Either<Failure, StudentModel>> getStudentData(
      {required String endPoint}) async {
    try {
      var data = await apiServices.get(endPoint: endPoint);
      StudentModel studentModel = StudentModel.fromJson(data);
      return right(studentModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> updateStudentData({
    required String endPoint,
    String? firstName,
    String? lastName,
    String? password,
    String? phone,
    String? studentLevel,
    XFile? image,
  }) async {
    try {
      var response = await apiServices.put(
        endPoint: endPoint,
        isFromData: true,
        data: {
          ApiKey.firstName: firstName ?? "",
          ApiKey.lastName: lastName ?? "",
          ApiKey.password: password ?? "",
          ApiKey.phone: phone != null ? "+2$phone" : "",
          ApiKey.studentLevel: studentLevel ?? "",
          ApiKey.image: image != null ? await uploadImageToApi(image) : "",
        },
      );
      return response != ""
          ? left(ServerFailure("حدث خطأ في تحديث البيانات"))
          : right("تم تحديث البيانات بنجاح");
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure("حدث خطأ في تحديث البيانات"));
    }
  }

  //
}

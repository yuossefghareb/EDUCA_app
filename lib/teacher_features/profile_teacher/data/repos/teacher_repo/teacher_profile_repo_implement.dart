import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:field_training_app/Core/api_services/api_service.dart';
import 'package:field_training_app/Core/api_services/end_points.dart';
import 'package:field_training_app/Core/api_services/failure.dart';
import 'package:field_training_app/student_features/auth/helper/upload_image_to_api.dart';
import 'package:field_training_app/teacher_features/profile_teacher/data/models/teacher_model.dart';
import 'package:field_training_app/teacher_features/profile_teacher/data/repos/teacher_repo/teacher_profile_repo.dart';
import 'package:image_picker/image_picker.dart';

class TeacherProfileRepoImplement implements TeacherProfileRepo {
  final ApiServices apiServices;

  TeacherProfileRepoImplement({required this.apiServices});
  @override
  Future<Either<Failure, TeacherModel>> getTeacherData(
      {required String endPoint}) async {
    try {
      var data = await apiServices.get(endPoint: endPoint);
      TeacherModel teacherModel = TeacherModel.fromJson(data);
      return right(teacherModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> updateTeacherData({
    required String endPoint,
    String? firstName,
    String? lastName,
    String? password,
    String? phone,
    String? address,
    String? governorate,
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
          ApiKey.address: address ?? "",
          ApiKey.governorate: governorate ?? "",
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

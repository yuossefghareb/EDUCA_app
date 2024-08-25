import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:field_training_app/Core/api_services/api_service.dart';
import 'package:field_training_app/Core/api_services/end_points.dart';
import 'package:field_training_app/student_features/auth/data/repos/auth_repo.dart';

import '../../../../Core/api_services/failure.dart';
import '../models/login_model.dart';

class AuthRepoImplement implements AuthRepo {
  final ApiServices apiServices;

  AuthRepoImplement({required this.apiServices});

  @override
  Future<Either<Failure, LoginModel>> login(
      {required String name, required String password}) async {
    try {
      var data = await apiServices.post(
        endPoint: EndPoint.login,
        data: {ApiKey.userName: name, ApiKey.password: password},
      );

      LoginModel loginModel = LoginModel.fromJson(data);
      return right(loginModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure("هذا الحساب غير موجود"));
    }
  }

//! Student Register
  @override
  Future<Either<Failure, String>> studentRegister({
    required String firstName,
    required String lastName,
    required String name,
    required String email,
    required String password,
    required String phone,
    required String studentLevel,
  }) async {
    try {
      var response = await apiServices.post(
        endPoint: EndPoint.studentRegister,
        isFromData: true,
        data: {
          ApiKey.firstName: firstName,
          ApiKey.lastName: lastName,
          ApiKey.userName: name,
          ApiKey.email: email,
          ApiKey.password: password,
          ApiKey.phone: "+2$phone",
          ApiKey.studentLevel: studentLevel,
        },
      );
      return response == null
          ? left(ServerFailure("أسم المستخدم هذا مستخدم مسبقا"))
          : right(response.toString());
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure("أسم المستخدم هذا مستخدم مسبقا"));
    }
  }

  //! Teacher Register
  @override
  Future<Either<Failure, String>> teacherRegister({
    required String firstName,
    required String lastName,
    required String name,
    required String email,
    required String password,
    required String phone,
    required String address,
    required String governorate,
  }) async {
    try {
      var response = await apiServices.post(
        endPoint: EndPoint.teacherRegister,
        isFromData: true,
        data: {
          ApiKey.firstName: firstName,
          ApiKey.lastName: lastName,
          ApiKey.userName: name,
          ApiKey.email: email,
          ApiKey.password: password,
          ApiKey.phone: "+2$phone",
          ApiKey.address: address,
          ApiKey.governorate: governorate,
        },
      );
      return response == null
          ? left(ServerFailure("أسم المستخدم هذا مستخدم مسبقا"))
          : right(response.toString());
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure("أسم المستخدم هذا مستخدم مسبقا"));
    }
  }
}

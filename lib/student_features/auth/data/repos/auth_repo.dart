import 'package:dartz/dartz.dart';
import '../../../../Core/api_services/failure.dart';
import '../models/login_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, LoginModel>> login({
    required String name,
    required String password,
  });

  Future<Either<Failure, String>> studentRegister({
    required String firstName,
    required String lastName,
    required String name,
    required String email,
    required String password,
    required String phone,
    required String studentLevel,
  });
  Future<Either<Failure, String>> teacherRegister({
    required String firstName,
    required String lastName,
    required String name,
    required String email,
    required String password,
    required String phone,
    required String address,
    required String governorate,
  });
}

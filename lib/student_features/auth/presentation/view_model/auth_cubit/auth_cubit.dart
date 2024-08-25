import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'package:field_training_app/Core/api_services/end_points.dart';
import 'package:field_training_app/cache/cache_helper.dart';
import 'package:field_training_app/student_features/auth/data/repos/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());

  final AuthRepo authRepo;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  XFile? image;
  String studentLevel = '';
  String governorate = '';

  //! Login method
  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      emit(AuthLoginLoading());
      var result = await authRepo.login(
        name: nameController.text.trim(),
        password: passwordController.text.trim(),
      );
      result.fold((failure) {
        emit(AuthLoginFailure(errMessage: failure.errMessage));
      }, (loginModel) {
        CacheHelper.saveData(key: ApiKey.token, value: loginModel.token);
        CacheHelper.saveData(key: ApiKey.id, value: loginModel.id);
        CacheHelper.saveData(key: ApiKey.role, value: loginModel.role);
        emit(AuthLoginSuccess());
      });
    }
  }

  //! Student Register method
  Future<void> studentRegister() async {
    emit(AuthRegisterLoading());
    var result = await authRepo.studentRegister(
      firstName: firstNameController.text.trim(),
      lastName: lastNameController.text.trim(),
      name: nameController.text.trim(),
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
      phone: phoneController.text.trim(),
      studentLevel: studentLevel,
    );
    result.fold((failure) {
      emit(AuthRegisterFailure(errMessage: failure.errMessage));
    }, (registerModel) {
      emit(AuthRegisterSuccess());
    });
  }

  //! Teacher Register method
  Future<void> teacherRegister() async {
    emit(AuthRegisterLoading());
    var result = await authRepo.teacherRegister(
      firstName: firstNameController.text.trim(),
      lastName: lastNameController.text.trim(),
      name: nameController.text.trim(),
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
      phone: phoneController.text.trim(),
      address: addressController.text.trim(),
      governorate: governorate,
    );
    result.fold((failure) {
      emit(AuthRegisterFailure(errMessage: failure.errMessage));
    }, (registerModel) {
      emit(AuthRegisterSuccess());
    });
  }
}

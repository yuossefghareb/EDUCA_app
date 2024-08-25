import 'package:field_training_app/Core/widgets/custom_cherry_toast.dart';
import 'package:field_training_app/student_features/auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Core/utils/app_regex.dart';

void registerValidation(BuildContext context, String optionState) {
  if (context.read<AuthCubit>().formKey.currentState!.validate()) {
    if (AppRegex.containsEnglish(
            context.read<AuthCubit>().firstNameController.text) ||
        AppRegex.containsEnglish(
            context.read<AuthCubit>().lastNameController.text)) {
      errorCherryToast(context, "حدث خطأ",
          'يجب ان يكون الأسم الأول و الأخير باللغة العربية');
    } else if (!AppRegex.hasNoArabic(
        context.read<AuthCubit>().nameController.text)) {
      errorCherryToast(
          context, "حدث خطأ", 'يجب ان يكون الأسم المسخدم باللغة الأنجليزية');
    } else if (!AppRegex.isEmailValid(
        context.read<AuthCubit>().emailController.text)) {
      errorCherryToast(context, "حدث خطأ", 'البريد الالكتروني غير صحيح');
    } else if (!AppRegex.hasMinLength(
        context.read<AuthCubit>().passwordController.text)) {
      errorCherryToast(context, "حدث خطأ", 'كلمة المرور قصيرة جداً');
    } else if (!AppRegex.hasLowerCase(
        context.read<AuthCubit>().passwordController.text)) {
      errorCherryToast(
          context, "حدث خطأ", 'يجب ان يحتوي كلمة المرور علي (a-z)');
    } else if (!AppRegex.hasUpperCase(
        context.read<AuthCubit>().passwordController.text)) {
      errorCherryToast(
          context, "حدث خطأ", 'يجب ان يحتوي كلمة المرور علي (A-Z)');
    } else if (!AppRegex.hasNumber(
        context.read<AuthCubit>().passwordController.text)) {
      errorCherryToast(context, "حدث خطأ", 'يجب ان يحتوي كلمة المرور علي رقم');
    } else if (!AppRegex.hasSpecialCharacter(
        context.read<AuthCubit>().passwordController.text)) {
      errorCherryToast(context, "حدث خطأ", 'يجب ان يحتوي كلمة المرور علي رمز');
    } else if (!AppRegex.isPhoneNumberValid(
        context.read<AuthCubit>().phoneController.text)) {
      errorCherryToast(context, "حدث خطأ", 'رقم الجوال غير صحيح');
    } else {
      if (optionState == 'طالب') {
        if (context.read<AuthCubit>().studentLevel != "أختر الصف الدراسي" &&
            context.read<AuthCubit>().studentLevel != "") {
          context.read<AuthCubit>().studentRegister();
        } else {
          errorCherryToast(context, "حدث خطأ", 'يرجي تحديد صف دراسي');
        }
      } else if (optionState == "معلم") {
        if (context.read<AuthCubit>().governorate != "أختر المحافظة" &&
            context.read<AuthCubit>().governorate != "") {
          context.read<AuthCubit>().teacherRegister();
        } else {
          errorCherryToast(context, "حدث خطأ", 'يرجي تحديد المحافظة');
        }
      } else {
        errorCherryToast(context, "حدث خطأ", 'يرجي تحديد نوع المستخدم');
      }
    }
  }
}

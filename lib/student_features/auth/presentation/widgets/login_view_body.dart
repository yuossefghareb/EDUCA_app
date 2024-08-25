import 'package:field_training_app/Core/api_services/end_points.dart';
import 'package:field_training_app/cache/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/utils/styles.dart';
import 'package:field_training_app/Core/widgets/custom_button.dart';
import 'package:field_training_app/Core/widgets/custom_cherry_toast.dart';
import 'package:field_training_app/Core/widgets/custom_loading_widget.dart';
import 'package:field_training_app/student_features/auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:field_training_app/student_features/auth/presentation/widgets/custom_text_field.dart';
import 'package:lottie/lottie.dart';

import '../../../../Core/utils/routes.dart';
import '../view_model/password_visibility_cubit.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Center(
            child: Lottie.asset(
              "assets/animation/login.json",
              frameRate: FrameRate.max,
            ),
          ),
        ),
        Expanded(
          flex: 6,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.only(left: 20, right: 20, top: 25),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35), topRight: Radius.circular(35)),
              boxShadow: [
                BoxShadow(
                  color: kShadowColor,
                  blurRadius: 2,
                  spreadRadius: 3,
                ),
              ],
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "تسجيل الدخول",
                    style: Styles.textStyle22,
                    textAlign: TextAlign.right,
                  ),
                  SizedBox(height: 30.h),
                  Form(
                    key: context.read<AuthCubit>().formKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: context.read<AuthCubit>().nameController,
                          hintText: "اسم المستخدم",
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 28.h),
                        BlocProvider(
                          create: (context) => PasswordVisibilityCubit(),
                          child: BlocBuilder<PasswordVisibilityCubit, bool>(
                            builder: (context, state) {
                              return CustomTextField(
                                controller: context
                                    .read<AuthCubit>()
                                    .passwordController,
                                hintText: "كلمة السر",
                                obscureText: state,
                                keyboardType: TextInputType.visiblePassword,
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    context
                                        .read<PasswordVisibilityCubit>()
                                        .changeState();
                                  },
                                  icon: state == false
                                      ? const Icon(Icons.visibility_rounded,
                                          color: kPrimaryColor)
                                      : const Icon(Icons.visibility_off_rounded,
                                          color: kPrimaryColor),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 100.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: BlocConsumer<AuthCubit, AuthState>(
                      listener: (context, state) {
                        if (state is AuthLoginSuccess) {
                          if (CacheHelper.getData(key: ApiKey.role) ==
                              "Student") {
                            Navigator.pushReplacementNamed(
                                context, Routes.customBottomBarViewRoute);
                          } else {
                            CacheHelper.getData(key: termsKey) == false
                                ? Navigator.pushReplacementNamed(
                                    context, Routes.termsViewRoute)
                                : Navigator.pushReplacementNamed(context,
                                    Routes.customBottomBarForTeacherViewRoute);
                          }
                        } else if (state is AuthLoginFailure) {
                          errorCherryToast(
                              context, "حدث خطا", state.errMessage);
                        }
                      },
                      builder: (context, state) {
                        return state is AuthLoginLoading
                            ? const CustomLoadingWidget()
                            : CustomButton(
                                text: "تسجيل",
                                onpressed: () {
                                  context.read<AuthCubit>().login();
                                },
                              );
                      },
                    ),
                  ),
                  SizedBox(height: 25.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, Routes.registerViewRoute);
                        },
                        child: Text(
                          "أنشاء",
                          style: Styles.textStyle14.copyWith(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Text(" ليس لديك حساب ؟", style: Styles.textStyle12),
                    ],
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

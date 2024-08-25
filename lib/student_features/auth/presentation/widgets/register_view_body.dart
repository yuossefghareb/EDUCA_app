import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/utils/styles.dart';
import 'package:field_training_app/Core/widgets/custom_button.dart';
import 'package:field_training_app/Core/widgets/custom_cherry_toast.dart';
import 'package:field_training_app/Core/widgets/custom_loading_widget.dart';
import 'package:field_training_app/Core/widgets/pop_icon_button.dart';
import 'package:field_training_app/student_features/auth/helper/register_validation.dart';
import 'package:field_training_app/student_features/auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:field_training_app/student_features/auth/presentation/view_model/governorate_cubit.dart';
import 'package:field_training_app/student_features/auth/presentation/view_model/student_level_cubit.dart';
import 'package:field_training_app/student_features/auth/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../Core/utils/routes.dart';
import '../view_model/password_visibility_cubit.dart';
import '../view_model/register_option_cubit.dart';
import 'class_option_values.dart';
import 'custom_radio_list_tile.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 15.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomPopIconButton(),
                Text(
                  "أنشاء حساب جديد",
                  style: Styles.textStyle20,
                  textAlign: TextAlign.right,
                ),
              ],
            ),
            SizedBox(height: 65.h),
            Form(
              key: context.read<AuthCubit>().formKey,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          controller:
                              context.read<AuthCubit>().lastNameController,
                          hintText: "الأسم الاخير",
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                      SizedBox(width: 20.w),
                      Expanded(
                        child: CustomTextField(
                          controller:
                              context.read<AuthCubit>().firstNameController,
                          hintText: "الأسم الأول",
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 27.h),
                  CustomTextField(
                    controller: context.read<AuthCubit>().nameController,
                    hintText: "اسم المستخدم",
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 26.h),
                  CustomTextField(
                    controller: context.read<AuthCubit>().emailController,
                    hintText: "البريد الالكتروني",
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 27.h),
                  BlocProvider(
                    create: (context) => PasswordVisibilityCubit(),
                    child: BlocBuilder<PasswordVisibilityCubit, bool>(
                      builder: (context, state) {
                        return CustomTextField(
                          controller:
                              context.read<AuthCubit>().passwordController,
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
                  SizedBox(height: 27.h),
                  CustomTextField(
                    controller: context.read<AuthCubit>().phoneController,
                    hintText: "رقم الجوال",
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(height: 25.h),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "التسجيل ك",
                      style: Styles.textStyle16,
                    ),
                  ),
                  BlocProvider(
                    create: (context) => OptionCubit(),
                    child: BlocBuilder<OptionCubit, String>(
                      builder: (context, optionState) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: CustomRadioListTile(
                                    optionState: optionState,
                                    value: "معلم",
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: CustomRadioListTile(
                                    optionState: optionState,
                                    value: "طالب",
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 12.h),
                            optionState == "طالب"
                                ? BlocProvider(
                                    create: (context) => StudentLevelCubit(),
                                    child:
                                        BlocBuilder<StudentLevelCubit, String>(
                                      builder: (context, studentLevelState) {
                                        return Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 3),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            border: Border.all(
                                                color: kPrimaryColor),
                                          ),
                                          child: DropdownButton(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            underline: Container(
                                                height: 1,
                                                color: Colors.transparent),
                                            icon: const Icon(
                                                Icons
                                                    .keyboard_arrow_down_rounded,
                                                color: kPrimaryColor,
                                                size: 30),
                                            alignment: Alignment.centerRight,
                                            style: Styles.textStyle16
                                                .copyWith(color: Colors.black),
                                            elevation: 1,
                                            hint: Text(
                                              studentLevelState,
                                              style: GoogleFonts.tajawal(
                                                  fontSize: 13.sp),
                                            ),
                                            onChanged: (val) {
                                              context
                                                  .read<StudentLevelCubit>()
                                                  .changeState(val.toString());
                                              context
                                                      .read<AuthCubit>()
                                                      .studentLevel =
                                                  val.toString();
                                            },
                                            isExpanded: true,
                                            items: classOptionsValues
                                                .map<DropdownMenuItem<String>>(
                                              (String value) {
                                                return DropdownMenuItem<String>(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  value: value,
                                                  child: Text(value,
                                                      style: GoogleFonts
                                                          .tajawal()),
                                                );
                                              },
                                            ).toList(),
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                : optionState == "معلم"
                                    ? Column(
                                        children: [
                                          BlocProvider(
                                            create: (context) =>
                                                GovernorateSelectCubit(),
                                            child: BlocBuilder<
                                                GovernorateSelectCubit, String>(
                                              builder:
                                                  (context, governateState) {
                                                return Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 3),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6),
                                                    border: Border.all(
                                                        color: kPrimaryColor),
                                                  ),
                                                  child: DropdownButton(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 10),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6),
                                                    underline: Container(
                                                        color:
                                                            Colors.transparent),
                                                    icon: const Icon(
                                                        Icons
                                                            .keyboard_arrow_down_rounded,
                                                        color: kPrimaryColor,
                                                        size: 30),
                                                    alignment:
                                                        Alignment.centerRight,
                                                    style: Styles.textStyle16
                                                        .copyWith(
                                                            color:
                                                                Colors.black),
                                                    elevation: 1,
                                                    hint: Text(
                                                      governateState,
                                                      style:
                                                          GoogleFonts.tajawal(
                                                              fontSize: 13.sp),
                                                    ),
                                                    onChanged: (val) {
                                                      context
                                                          .read<
                                                              GovernorateSelectCubit>()
                                                          .changeState(
                                                              val.toString());
                                                      context
                                                              .read<AuthCubit>()
                                                              .governorate =
                                                          val.toString();
                                                    },
                                                    isExpanded: true,
                                                    items: governorates.map<
                                                        DropdownMenuItem<
                                                            String>>(
                                                      (String value) {
                                                        return DropdownMenuItem<
                                                            String>(
                                                          alignment: Alignment
                                                              .centerRight,
                                                          value: value,
                                                          child: Text(value,
                                                              style: GoogleFonts
                                                                  .tajawal()),
                                                        );
                                                      },
                                                    ).toList(),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                          SizedBox(height: 12.h),
                                          CustomTextField(
                                            controller: context
                                                .read<AuthCubit>()
                                                .addressController,
                                            hintText: "العنوان",
                                            keyboardType: TextInputType.text,
                                          ),
                                        ],
                                      )
                                    : const SizedBox.shrink(),
                            optionState == ""
                                ? SizedBox(height: 70.h)
                                : SizedBox(height: 35.h),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: BlocConsumer<AuthCubit, AuthState>(
                                listener: (context, state) {
                                  if (state is AuthRegisterSuccess) {
                                    successCherryToast(
                                      context,
                                      "عملية ناجحة",
                                      "تم تسجيل حسابك بنجاح",
                                    );

                                    Navigator.pushNamed(
                                        context, Routes.loginViewRoute);
                                  } else if (state is AuthRegisterFailure) {
                                    errorCherryToast(
                                      context,
                                      "حدث خطأ",
                                      state.errMessage,
                                    );
                                  }
                                },
                                builder: (context, state) {
                                  return state is AuthRegisterLoading
                                      ? const CustomLoadingWidget()
                                      : CustomButton(
                                          text: "أنشاء",
                                          onpressed: () {
                                            registerValidation(
                                              context,
                                              optionState,
                                            );
                                          },
                                        );
                                },
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.loginViewRoute);
                  },
                  child: Text(
                    "تسجيل",
                    style: Styles.textStyle14.copyWith(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Text(" لديك بالفعل حساب ؟", style: Styles.textStyle12),
              ],
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}

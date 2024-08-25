import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:field_training_app/Core/api_services/end_points.dart';
import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/widgets/custom_button.dart';
import 'package:field_training_app/Core/widgets/custom_failure_widget.dart';
import 'package:field_training_app/Core/widgets/custom_loading_widget.dart';
import 'package:field_training_app/Core/widgets/profile_user_image.dart';
import 'package:field_training_app/cache/cache_helper.dart';
import 'package:field_training_app/student_features/profile/presentation/view_model/cubit/student_profile_cubit.dart';
import 'package:field_training_app/student_features/profile/presentation/widgets/custom_profile_edit_name.dart';
import 'package:field_training_app/student_features/profile/presentation/widgets/profile_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/utils/routes.dart';
import '../../../../Core/utils/styles.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: BlocBuilder<StudentProfileCubit, StudentProfileState>(
        builder: (context, state) {
          if (state is StudentProfileSuccess) {
            CacheHelper.saveData(
                key: studentFirstName, value: state.studentModel.firstName!);
            CacheHelper.saveData(
                key: studentEmail, value: state.studentModel.email!);
            CacheHelper.saveData(
                key: studentLastName, value: state.studentModel.lastName!);
            CacheHelper.saveData(
                key: studentPhone, value: state.studentModel.phone!);
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 22.h),
                  ProfileUserImage(
                    iconSize: 45,
                    right: 105.w,
                    top: 80.h,
                    cameraSize: 21,
                    image: state.studentModel.profileImageUrl,
                  ),
                  SizedBox(height: 14.h),
                  Text(
                      "${state.studentModel.firstName} ${state.studentModel.lastName}",
                      style: Styles.textStyle24
                          .copyWith(fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center),
                  SizedBox(height: 2.h),
                  Text(state.studentModel.email ?? '',
                      style: Styles.textStyle16, textAlign: TextAlign.center),
                  SizedBox(height: 28.h),
                  Row(
                    children: [
                      Expanded(
                        child: CustomProfileEditName(
                          title: "الأسم الأخير",
                          name: state.studentModel.lastName ?? '',
                          onPressed: () {
                            Navigator.pushNamed(
                                context, Routes.profileEditViewRoute,
                                arguments: {
                                  "parameter": "lastName",
                                  "value": state.studentModel.lastName!
                                });
                          },
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: CustomProfileEditName(
                          title: "الأسم الاول",
                          name: state.studentModel.firstName ?? '',
                          onPressed: () {
                            Navigator.pushNamed(
                                context, Routes.profileEditViewRoute,
                                arguments: {
                                  "parameter": "firstName",
                                  "value": state.studentModel.firstName!
                                });
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 27.h),
                  ProfileItem(
                    isEdit: false,
                    title: "أسم المستخدم",
                    value: state.studentModel.userName ?? '',
                    iconData: Icons.person,
                    onpressed: () {},
                  ),
                  SizedBox(height: 27.h),
                  ProfileItem(
                    title: "كلمة المرور",
                    value: '********',
                    iconData: Icons.lock,
                    onpressed: () {
                      Navigator.pushNamed(context, Routes.profileEditViewRoute,
                          arguments: {
                            "parameter": "password",
                            "value": '',
                          });
                    },
                  ),
                  SizedBox(height: 27.h),
                  ProfileItem(
                    title: "رقم الجوال",
                    value: state.studentModel.phone!
                        .substring(2, state.studentModel.phone!.length),
                    iconData: Icons.phone_android_rounded,
                    onpressed: () {
                      Navigator.pushNamed(context, Routes.profileEditViewRoute,
                          arguments: {
                            "parameter": "phone",
                            "value": state.studentModel.phone!
                                .substring(2, state.studentModel.phone!.length),
                          });
                    },
                  ),
                  SizedBox(height: 27.h),
                  ProfileItem(
                    title: "الصف الدراسي",
                    value: state.studentModel.studentLevel ?? '',
                    iconData: Icons.school,
                    onpressed: () {
                      Navigator.pushNamed(
                        context,
                        Routes.profileSelectClassEditViewRoute,
                        arguments: state.studentModel.studentLevel ?? '',
                      );
                    },
                  ),
                  SizedBox(height: 30.h),
                  CustomButton(
                      text: "تسجيل الخروج",
                      onpressed: () {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.infoReverse,
                          animType: AnimType.topSlide,
                          title: 'تنبيه',
                          desc: 'هل تريد تسجيل الخروج؟',
                          btnCancelOnPress: () {},
                          btnOkOnPress: () {
                            CacheHelper.removeData(key: ApiKey.token);
                            CacheHelper.removeData(key: ApiKey.id);
                            CacheHelper.removeData(key: ApiKey.role);
                            Navigator.pushNamedAndRemoveUntil(context,
                                Routes.loginViewRoute, (route) => false);
                          },
                          btnOkText: 'نعم',
                          btnCancelText: 'لا',
                        ).show();
                      }),
                  SizedBox(height: 14.h),
                ],
              ),
            );
          } else if (state is StudentProfileFailure) {
            return const CustomFailureWidget(
                errMessage: 'للأسف حدث خطأ ما , حاول مرة أخرى');
          }
          return const CustomLoadingWidget();
        },
      ),
    );
  }
}

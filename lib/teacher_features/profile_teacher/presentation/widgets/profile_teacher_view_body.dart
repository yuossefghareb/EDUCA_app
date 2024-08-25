import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:field_training_app/Core/widgets/custom_button.dart';
import 'package:field_training_app/Core/widgets/custom_failure_widget.dart';
import 'package:field_training_app/Core/widgets/custom_loading_widget.dart';
import 'package:field_training_app/Core/widgets/profile_teacher_image.dart';

import 'package:field_training_app/student_features/profile/presentation/widgets/custom_profile_edit_name.dart';
import 'package:field_training_app/student_features/profile/presentation/widgets/profile_item.dart';
import 'package:field_training_app/teacher_features/profile_teacher/presentation/view_model/cubit/teacher_profile_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/utils/routes.dart';
import '../../../../Core/utils/styles.dart';

class ProfileTeacherViewBody extends StatelessWidget {
  const ProfileTeacherViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: BlocBuilder<TeacherProfileCubit, TeacherProfileState>(
        builder: (context, state) {
          if (state is TeacherProfileSuccess) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 22.h),
                  ProfileTeacherImage(
                    iconSize: 45,
                    right: 105.w,
                    top: 80.h,
                    cameraSize: 21,
                    image: state.teacherModel.profileImageUrl,
                  ),
                  SizedBox(height: 25.h),
                  Text(
                      "${state.teacherModel.firstName} ${state.teacherModel.lastName}",
                      style: Styles.textStyle24
                          .copyWith(fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center),
                  SizedBox(height: 2.h),
                  Text(state.teacherModel.email ?? '',
                      style: Styles.textStyle16, textAlign: TextAlign.center),
                  SizedBox(height: 28.h),
                  Row(
                    children: [
                      Expanded(
                        child: CustomProfileEditName(
                          title: "الأسم الأخير",
                          name: state.teacherModel.lastName ?? '',
                          onPressed: () {
                            Navigator.pushNamed(
                                context, Routes.teacherProfileEditViewRoute,
                                arguments: {
                                  "parameter": "lastName",
                                  "value": state.teacherModel.lastName!
                                });
                          },
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: CustomProfileEditName(
                          title: "الأسم الاول",
                          name: state.teacherModel.firstName ?? '',
                          onPressed: () {
                            Navigator.pushNamed(
                                context, Routes.teacherProfileEditViewRoute,
                                arguments: {
                                  "parameter": "firstName",
                                  "value": state.teacherModel.firstName!
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
                    value: state.teacherModel.userName ?? '',
                    iconData: Icons.person,
                    onpressed: () {},
                  ),
                  SizedBox(height: 27.h),
                  ProfileItem(
                    title: "كلمة المرور",
                    value: '********',
                    iconData: Icons.lock,
                    onpressed: () {
                      Navigator.pushNamed(
                          context, Routes.teacherProfileEditViewRoute,
                          arguments: {
                            "parameter": "password",
                            "value": "",
                          });
                    },
                  ),
                  SizedBox(height: 27.h),
                  ProfileItem(
                    title: "رقم الجوال",
                    value: state.teacherModel.phone!
                        .substring(2, state.teacherModel.phone!.length),
                    iconData: Icons.phone_android_rounded,
                    onpressed: () {
                      Navigator.pushNamed(
                          context, Routes.teacherProfileEditViewRoute,
                          arguments: {
                            "parameter": "phone",
                            "value": state.teacherModel.phone!
                                .substring(2, state.teacherModel.phone!.length),
                          });
                    },
                  ),
                  SizedBox(height: 27.h),
                  ProfileItem(
                    title: " المحافظة",
                    value: state.teacherModel.governorate ?? '',
                    iconData: Icons.school,
                    onpressed: () {
                      Navigator.pushNamed(
                          context, Routes.teacherProfileEditViewRoute,
                          arguments: {
                            "parameter": "Governorate",
                            "value": state.teacherModel.governorate!,
                          });
                    },
                  ),
                  SizedBox(height: 27.h),
                  ProfileItem(
                    title: " العنوان",
                    value: state.teacherModel.address ?? '',
                    iconData: Icons.school,
                    onpressed: () {
                      Navigator.pushNamed(
                          context, Routes.teacherProfileEditViewRoute,
                          arguments: {
                            "parameter": "address",
                            "value": state.teacherModel.address!,
                          });
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
          } else if (state is TeacherProfileFailure) {
            return CustomFailureWidget(errMessage: state.errMessage);
          }
          return const CustomLoadingWidget();
        },
      ),
    );
  }
}

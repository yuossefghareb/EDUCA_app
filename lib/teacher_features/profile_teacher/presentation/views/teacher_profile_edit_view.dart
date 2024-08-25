// ignore_for_file: must_be_immutable
import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/utils/routes.dart';
import 'package:field_training_app/Core/widgets/custom_button.dart';
import 'package:field_training_app/Core/widgets/custom_cherry_toast.dart';
import 'package:field_training_app/Core/widgets/custom_loading_widget.dart';
import 'package:field_training_app/cache/cache_helper.dart';

import 'package:field_training_app/teacher_features/profile_teacher/presentation/view_model/cubit/teacher_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/utils/styles.dart';

class TeacherProfileEditView extends StatefulWidget {
  const TeacherProfileEditView(
      {super.key, required this.value, required this.parameter});

  final String value;
  final String parameter;

  @override
  State<TeacherProfileEditView> createState() => _TeacherProfileEditViewState();
}

class _TeacherProfileEditViewState extends State<TeacherProfileEditView> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    controller.text = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "تعديل بيانات المعلم",
                style: Styles.textStyle24.copyWith(
                    fontWeight: FontWeight.bold, color: kPrimaryColor),
                textAlign: TextAlign.right,
              ),
              SizedBox(height: 50.h),
              TextFormField(
                controller: controller,
                cursorColor: kPrimaryColor,
                cursorErrorColor: Colors.red,
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: const BorderSide(color: kPrimaryColor),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
              SizedBox(height: 40.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: BlocConsumer<TeacherProfileCubit, TeacherProfileState>(
                  listener: (context, state) {
                    if (state is TeacherProfileUpdateSuccess) {
                      successCherryToast(
                          context, "عملية ناجحة", "تم تعديل بياناتك");

                      Navigator.pushNamed(
                          context, Routes.customBottomBarForTeacherViewRoute);
                    } else if (state is TeacherProfileUpdateFailure) {
                      errorCherryToast(context, "حدث خطأ", state.errMessage);
                    }
                  },
                  builder: (context, state) {
                    return state is TeacherProfileUpdateLoading
                        ? const CustomLoadingWidget()
                        : CustomButton(
                            text: "تعديل",
                            onpressed: () {
                              if (controller.text == "" ||
                                  controller.text.isEmpty) {
                                errorCherryToast(context, "حدث خطأ",
                                    "قم بتعبئة هذا الحقل");
                              } else {
                                context
                                    .read<TeacherProfileCubit>()
                                    .updateTeacherData(
                                      firstName: widget.parameter == "firstName"
                                          ? controller.text.trim()
                                          : null,
                                      lastName: widget.parameter == "lastName"
                                          ? controller.text.trim()
                                          : null,
                                      phone: widget.parameter == "phone"
                                          ? controller.text.trim()
                                          : null,
                                      password: widget.parameter == "password"
                                          ? controller.text.trim()
                                          : null,
                                      address: widget.parameter == "address"
                                          ? controller.text.trim()
                                          : null,
                                      governorate:
                                          widget.parameter == "Governorate"
                                              ? controller.text.trim()
                                              : null,
                                      image: null,
                                    );

                                widget.parameter == "password"
                                    ? CacheHelper.saveData(
                                        key: passwordKey,
                                        value: controller.text.trim())
                                    : null;
                              }
                            });
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

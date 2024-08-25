// ignore_for_file: must_be_immutable
import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/utils/routes.dart';
import 'package:field_training_app/Core/widgets/custom_button.dart';
import 'package:field_training_app/Core/widgets/custom_cherry_toast.dart';
import 'package:field_training_app/Core/widgets/custom_loading_widget.dart';
import 'package:field_training_app/Core/widgets/pop_icon_button.dart';
import 'package:field_training_app/student_features/profile/presentation/view_model/cubit/student_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/utils/styles.dart';

class ProfileEditView extends StatefulWidget {
  const ProfileEditView(
      {super.key, required this.value, required this.parameter});

  final String value;
  final String parameter;

  @override
  State<ProfileEditView> createState() => _ProfileEditViewState();
}

class _ProfileEditViewState extends State<ProfileEditView> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    controller.text = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title:
            CustomPopIconButton(backgroundColor: Colors.white70, radius: 18.r),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text("تعديل البيانات",
                style: Styles.textStyle18.copyWith(color: Colors.white)),
          ),
          SizedBox(width: 14.w),
        ],
        elevation: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: 60,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 10.h),
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
              SizedBox(height: 60.h),
              BlocConsumer<StudentProfileCubit, StudentProfileState>(
                listener: (context, state) {
                  if (state is StudentProfileUpdateSuccess) {
                    successCherryToast(
                        context, "عملية ناجحة", "تم تعديل بياناتك");

                    Navigator.pushReplacementNamed(
                        context, Routes.customBottomBarViewRoute);
                  } else if (state is StudentProfileUpdateFailure) {
                    errorCherryToast(context, "حدث خطأ", state.errMessage);
                  }
                },
                builder: (context, state) {
                  return state is StudentProfileUpdateLoading
                      ? const CustomLoadingWidget()
                      : CustomButton(
                          text: "تعديل",
                          onpressed: () {
                            if (controller.text == "" ||
                                controller.text.isEmpty) {
                              errorCherryToast(
                                  context, "حدث خطأ", "قم بتعبئة هذا الحقل");
                            } else {
                              context
                                  .read<StudentProfileCubit>()
                                  .updateStudentData(
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
                                    studentLevel: null,
                                    image: null,
                                  );
                            }
                          });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

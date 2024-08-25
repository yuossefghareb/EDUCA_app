import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/utils/styles.dart';
import 'package:field_training_app/Core/widgets/custom_button.dart';
import 'package:field_training_app/Core/widgets/custom_cherry_toast.dart';
import 'package:field_training_app/Core/widgets/custom_loading_widget.dart';
import 'package:field_training_app/teacher_features/courses/presentation/views_model/add_course_cubit/add_course_cubit.dart';

import 'package:field_training_app/teacher_features/teacher/data/course_data.dart';
import 'package:field_training_app/teacher_features/teacher/presentation/views_model/cubit/drop_down_list_cubit.dart';
import 'package:field_training_app/teacher_features/teacher/presentation/widgets/custom_detail_create_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/utils/routes.dart';
import '../../../../student_features/auth/presentation/widgets/class_option_values.dart';
import 'custom_class_options_shape.dart';

class CreateClassViewBody extends StatelessWidget {
  const CreateClassViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const CustomClassOptionsShape(text: "أنشاء مادة جديدة"),
          SizedBox(height: 35.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: BlocBuilder<DropDownListCubit, String>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomDetailsForCreateClass(
                      indx: 0,
                      name: "الصف الدراسي",
                      hint: "الأول الأبتدائي",
                      selectedItem:
                          BlocProvider.of<DropDownListCubit>(context).lev,
                      onSelected: (value) {
                        BlocProvider.of<DropDownListCubit>(context)
                            .changeIndexDropDownListLevel(value);
                        BlocProvider.of<DropDownListCubit>(context)
                            .changeIndexDropDownListsubject(subfo[
                                BlocProvider.of<DropDownListCubit>(context)
                                    .lev]![0]);
                        context.read<AddCourseCubit>().level = value;
                      },
                      listItemBuilder: classOptionsValues,
                    ),
                    SizedBox(height: 15.h),
                    CustomDetailsForCreateClass(
                      indx: 1,
                      name: "أسم المادة",
                      hint: "الرياضيات",
                      selectedItem:
                          BlocProvider.of<DropDownListCubit>(context).sub,
                      onSelected: (value) {
                        BlocProvider.of<DropDownListCubit>(context)
                            .changeIndexDropDownListsubject(value);
                        context.read<AddCourseCubit>().subjName = value;
                      },
                      listItemBuilder: subfo[
                              BlocProvider.of<DropDownListCubit>(context)
                                  .lev] ??
                          subfo["الصف الاول الابتدائي"]!,
                    ),
                    SizedBox(height: 35.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: CustomDetailsForCreateClass(
                            indx: 2,
                            name: "سعر الحصة",
                            hint: "25 جنية",
                            selectedItem:
                                BlocProvider.of<DropDownListCubit>(context)
                                    .price,
                            onSelected: (value) {
                              BlocProvider.of<DropDownListCubit>(context)
                                  .changeIndexDropDownListprice(value);
                              context.read<AddCourseCubit>().price =
                                  int.parse(value);
                            },
                            listItemBuilder: coursePrice,
                          ),
                        ),
                        SizedBox(width: 15.w),
                        Expanded(
                          child: CustomDetailsForCreateClass(
                            indx: 1,
                            name: "الترم",
                            hint: "الاول",
                            selectedItem:
                                BlocProvider.of<DropDownListCubit>(context)
                                    .term,
                            onSelected: (value) {
                              BlocProvider.of<DropDownListCubit>(context)
                                  .changeIndexDropDownListterm(value);
                              if (value == "ألاول") {
                                context.read<AddCourseCubit>().term = 1;
                              } else {
                                context.read<AddCourseCubit>().term = 2;
                              }
                            },
                            listItemBuilder: const ['ألاول', 'الثاني'],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 35.h),
                    Text(
                      "وصف المادة",
                      textDirection: TextDirection.rtl,
                      style: Styles.textStyle14
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10.h),
                    TextField(
                      controller: context.read<AddCourseCubit>().controller,
                      cursorColor: kPrimaryColor,
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        hintText: "اكتب وصف للمادة",
                        hintStyle:
                            Styles.textStyle14.copyWith(color: kPrimaryColor),
                        filled: true,
                        fillColor: kSplashColor,
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: kSplashColor),
                            borderRadius: BorderRadius.all(Radius.circular(6))),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: kPrimaryColor),
                            borderRadius: BorderRadius.all(Radius.circular(6))),
                      ),
                    ),
                    SizedBox(height: 35.h),
                    
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "سعر الكورس كامل",
                          textDirection: TextDirection.rtl,
                          style: Styles.textStyle14
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10.h),
                        TextField(
                          controller: context.read<AddCourseCubit>().totalPrice,
                          cursorColor: kPrimaryColor,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                            hintText: "ادخل السعر",
                            hintStyle: Styles.textStyle14
                                .copyWith(color: kPrimaryColor),
                            filled: true,
                            fillColor: kSplashColor,
                            enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: kSplashColor),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6))),
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: kPrimaryColor),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6))),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30.h),
                    BlocConsumer<AddCourseCubit, AddCourseState>(
                      listener: (context, state) {
                        if (state is AddCourseSuccess) {
                          successCherryToast(
                            context,
                            "عملية ناجحة",
                            "تم انشاء المادة بنجاح",
                          );

                          Navigator.pushNamed(context,
                              Routes.customBottomBarForTeacherViewRoute);
                        } else if (state is AddCourseFailure) {
                          errorCherryToast(
                            context,
                            "حدث خطأ",
                            state.errMessage,
                          );
                        }
                      },
                      builder: (context, state) {
                        return state is AddCourseLoading
                            ? const CustomLoadingWidget()
                            : CustomButton(
                                text: "أنشاء",
                                onpressed: () {
                                  context.read<AddCourseCubit>().addCourse();
                                },
                              );
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/utils/routes.dart';
import 'package:field_training_app/Core/utils/styles.dart';
import 'package:field_training_app/Core/widgets/custom_failure_widget.dart';
import 'package:field_training_app/Core/widgets/custom_loading_widget.dart';
import 'package:field_training_app/cache/cache_helper.dart';
import 'package:field_training_app/student_features/home/presentation/view_model/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../courses/presentation/widgets/course_item.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 15.h),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.searchOptionViewRoute);
                  },
                  icon: const Icon(
                    Icons.search_rounded,
                    color: kPrimaryColor,
                    size: 28,
                  ),
                  style: IconButton.styleFrom(backgroundColor: kSplashColor),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Image.asset("assets/images/welcome2.png",
                          width: 30.w),
                    ),
                    SizedBox(width: 10.h),
                    Text(
                      "مرحبا, ${CacheHelper.getData(key: studentFirstName)}",
                      textDirection: TextDirection.rtl,
                      style: Styles.textStyle22,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Text(
              "ما تريد ان تتعلم اليوم؟",
              textDirection: TextDirection.rtl,
              style: Styles.textStyle14.copyWith(color: Colors.grey),
            ),
          ),
          SizedBox(height: 20.h),
          Padding(
            padding: const EdgeInsets.only(left: 35),
            child: Container(
              padding: EdgeInsets.only(right: 20.w, left: 5.w),
              width: double.infinity,
              height: 73,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100.r),
                  topLeft: Radius.circular(100.r),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    style: IconButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: kPrimaryColor,
                        padding: const EdgeInsets.all(13)),
                    onPressed: () {
                      Navigator.pushNamed(
                          context, Routes.searchOptionViewRoute);
                    },
                    icon: const Icon(
                      Icons.arrow_back_rounded,
                      size: 38,
                    ),
                  ),
                  Text(
                    "ابحث الأن\nوابدأ رحلتك التعليمية",
                    textDirection: TextDirection.rtl,
                    style: Styles.textStyle18.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 25.h),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Text(
              "المواد الدراسية الاخيرة",
              textDirection: TextDirection.rtl,
              style: Styles.textStyle16,
            ),
          ),
          SizedBox(height: 15.h),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: SizedBox(
              height: 242,
              child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is HomeGetSubjectsSuccess) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      reverse: true,
                      itemCount: (state.subjectList.length / 2).ceil(),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: CourseItem(
                            subjectModel: state.subjectList[index],
                          ),
                        );
                      },
                    );
                  } else if (state is HomeGetSubjectsFailure) {
                    return const CustomFailureWidget(
                      errMessage: 'حدث خطأ أثناء تحميل المواد الدراسية',
                    );
                  }
                  return const CustomLoadingWidget();
                },
              ),
            ),
          ),
          SizedBox(height: 30.h),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Text(
              "مواد دراسية موصي بها",
              textDirection: TextDirection.rtl,
              style: Styles.textStyle16,
            ),
          ),
          SizedBox(height: 15.h),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: SizedBox(
              height: 242,
              child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is HomeGetSubjectsSuccess) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      reverse: true,
                      itemCount: state.subjectList.length -
                          (state.subjectList.length / 2).ceil(),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: CourseItem(
                            subjectModel: state.subjectList[index +
                                ((state.subjectList.length / 2).ceil())],
                          ),
                        );
                      },
                    );
                  } else if (state is HomeGetSubjectsFailure) {
                    return const CustomFailureWidget(
                        errMessage: 'حدث خطأ أثناء تحميل المواد الدراسية');
                  }
                  return const CustomLoadingWidget();
                },
              ),
            ),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}

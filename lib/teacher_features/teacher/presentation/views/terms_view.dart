import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/utils/routes.dart';
import 'package:field_training_app/Core/utils/styles.dart';
import 'package:field_training_app/cache/cache_helper.dart';
import 'package:field_training_app/teacher_features/teacher/data/course_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TermsView extends StatelessWidget {
  TermsView({super.key});
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('الشروط والتعليمات')),
      ),
      body: ScrollbarTheme(
        data: const ScrollbarThemeData(
            thumbColor: WidgetStatePropertyAll(kPrimaryColor)),
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(height: 16.h),
                Center(
                  child: Text(
                    "أهلا بك في EDUCA",
                    style: Styles.textStyle20,
                    textDirection: TextDirection.rtl,
                  ),
                ),
                SizedBox(height: 15.h),
                Container(
                  padding: EdgeInsets.only(
                      left: 6.w, right: 14.w, top: 14.h, bottom: 14.h),
                  width: double.infinity,
                  height: 570.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(color: Colors.grey.shade400),
                  ),
                  child: Scrollbar(
                    scrollbarOrientation: ScrollbarOrientation.left,
                    thickness: 6,
                    controller: _scrollController,
                    thumbVisibility: true,
                    radius: Radius.circular(20.r),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          tremstext,
                          style: Styles.textStyle16,
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25.h),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.w, vertical: 8.h),
                  ),
                  child: Text(
                    'موافقة',
                    style: TextStyle(color: Colors.white, fontSize: 20.sp),
                  ),
                  onPressed: () {
                    CacheHelper.saveData(key: termsKey, value: true);
                    Navigator.pushReplacementNamed(
                        context, Routes.customBottomBarForTeacherViewRoute);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

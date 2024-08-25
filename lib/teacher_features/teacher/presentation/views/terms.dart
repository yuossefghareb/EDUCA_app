import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/teacher_features/teacher/data/course_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Terms extends StatelessWidget {
  final _scrollController = ScrollController();

  Terms({super.key});

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
          child: Column(
            children: [
              const Center(
                child: Text(
                  '!اهلا بك في تطبيق [اسم التطبيق] ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 15.h),
              Container(
                width: 320.w,
                height: 570.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey, width: 1.0),
                  color: Colors.transparent, // Set the desired color here
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Scrollbar(
                    scrollbarOrientation: ScrollbarOrientation.left,
                    thickness: 8,
                    controller: _scrollController,
                    trackVisibility: true,
                    thumbVisibility: true,
                    radius: Radius.circular(20.r),
                    child: const SingleChildScrollView(
                      child: Text(
                        tremstext,
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15.h),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
                child: const Text(
                  'موافقة',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}

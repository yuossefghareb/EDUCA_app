import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/utils/styles.dart';
import 'package:field_training_app/Core/widgets/pop_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/lesson_details_view_body.dart';

class LessonDetailsView extends StatelessWidget {
  const LessonDetailsView({super.key});

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
            child: Text("محتوي الدرس",
                style: Styles.textStyle18.copyWith(color: Colors.white)),
          ),
          SizedBox(width: 14.w),
        ],
        elevation: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: 60,
      ),
      body: const LessonDetailsViewBody(),
    );
  }
}

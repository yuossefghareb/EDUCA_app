import 'package:field_training_app/Core/utils/styles.dart';
import 'package:field_training_app/Core/widgets/profile_user_image.dart';

import 'package:field_training_app/student_features/enrollment/data/models/all_students_enrolled_in_spec_subject_model/st_dto.dart';

import 'package:field_training_app/student_features/profile/presentation/widgets/profile_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EnrolledStudentDetailsViewBody extends StatelessWidget {
  const EnrolledStudentDetailsViewBody({super.key, required this.stDto});

  final StDto stDto;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 100.h),
            ProfileUserImage(
              iconSize: 45,
              right: 112.w,
              top: 70.h,
              cameraSize: 22,
              image: stDto.profileImageUrl,
              isEdit: false,
            ),
            SizedBox(height: 16.h),
            Text("${stDto.firstName} ${stDto.lastName}",
                style: Styles.textStyle24.copyWith(fontWeight: FontWeight.w600),
                textAlign: TextAlign.center),
            SizedBox(height: 2.h),
            Text(stDto.email ?? '',
                style: Styles.textStyle16, textAlign: TextAlign.center),
            SizedBox(height: 28.h),
            SizedBox(height: 27.h),
            ProfileItem(
              isEdit: false,
              title: "البريد الالكتروني",
              value: stDto.email ?? 'yuossefghareb27@gmail.com',
              iconData: Icons.email,
              onpressed: () {},
            ),
            SizedBox(height: 27.h),
            ProfileItem(
              title: "رقم الجوال",
              value: stDto.phone ?? '010187559377',
              isEdit: false,
              iconData: Icons.phone_android_rounded,
              onpressed: () {},
            ),
            SizedBox(height: 27.h),
            ProfileItem(
              title: "الصف الدراسي",
              value: stDto.level ?? '',
              isEdit: false,
              iconData: Icons.school,
              onpressed: () {},
            ),
            SizedBox(height: 30.h),
            SizedBox(height: 14.h),
          ],
        ),
      ),
    );
  }
}

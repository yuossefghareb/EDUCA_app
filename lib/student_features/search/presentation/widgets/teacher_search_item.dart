import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/models/teacher_model.dart';
import 'package:field_training_app/Core/utils/routes.dart';
import 'package:field_training_app/Core/utils/styles.dart';
import 'package:field_training_app/Core/widgets/custom_cached_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TeacherSearchItem extends StatelessWidget {
  const TeacherSearchItem({super.key, required this.teacherSearchedModel});

  final TeacherModel teacherSearchedModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.teacherDetailsViewRoute,
            arguments: teacherSearchedModel.id);
      },
      child: Container(
        width: double.infinity,
        height: 70.h,
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(color: Colors.grey, width: 0.4)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "${teacherSearchedModel.firstName} ${teacherSearchedModel.lastName}",
              style: Styles.textStyle14,
            ),
            SizedBox(width: 10.w),
            Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  color: kSplashColor,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: CustomCachedImage(
                  loadingWidth: 20.w,
                  imageUrl: teacherSearchedModel.profileImageUrl ?? '',
                  errorIconSize: 22,
                ))
          ],
        ),
      ),
    );
  }
}

import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/utils/routes.dart';
import 'package:field_training_app/Core/utils/styles.dart';
import 'package:field_training_app/Core/models/subject_model.dart';
import 'package:field_training_app/Core/widgets/custom_cached_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubjectSearchItem extends StatelessWidget {
  const SubjectSearchItem({super.key, required this.subjectSearchedModel});
  final SubjectModel subjectSearchedModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.courseDetailsViewRoute,
          arguments: subjectSearchedModel,
        );
      },
      borderRadius: BorderRadius.circular(10.r),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("${subjectSearchedModel.teacherName}"),
                SizedBox(width: 10.w),
                Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: kSplashColor,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: CustomCachedImage(
                      loadingWidth: 18.w,
                      imageUrl: subjectSearchedModel.profileImageUrl ?? '',
                      errorIconSize: 18,
                    ))
              ],
            ),
            SizedBox(height: 14.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                    "${subjectSearchedModel.level} / ${subjectSearchedModel.term == 1 ? "الأول" : "الثاني"}",
                    style: Styles.textStyle10),
                Text("${subjectSearchedModel.subjName}",
                    style: Styles.textStyle16),
              ],
            ),
            // SizedBox(height: 3.h),
            // const Divider(color: Colors.grey, thickness: 0.4),
          ],
        ),
      ),
    );
  }
}

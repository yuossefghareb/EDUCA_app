import 'package:field_training_app/Core/models/subject_model.dart';
import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/utils/routes.dart';
import 'package:field_training_app/Core/utils/styles.dart';
import 'package:field_training_app/Core/utils/subject_image.dart';
import 'package:field_training_app/Core/widgets/custom_cached_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseItem extends StatelessWidget {
  const CourseItem({super.key, required this.subjectModel});
  final SubjectModel subjectModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.courseDetailsViewRoute,
          arguments: subjectModel,
        );
      },
      splashColor: kSplashColor,
      borderRadius: BorderRadius.circular(8.r),
      child: Container(
        width: 230.w,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(8, 0, 0, 0),
              blurRadius: 3.0,
            ),
          ],
          border: Border(
              left: BorderSide(color: Colors.grey.shade300, width: 0.5),
              right: BorderSide(color: Colors.grey.shade300, width: 0.5),
              bottom: BorderSide(color: Colors.grey.shade300, width: 0.6)),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.r),
                topRight: Radius.circular(8.r),
              ),
              child: Image.asset(
                subjectImage(subjectModel.subjName!),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w, top: 10.h, bottom: 4.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(subjectModel.teacherName!,
                            style: Styles.textStyle14.copyWith(
                                fontWeight: FontWeight.bold, fontSize: 12.sp)),
                        SizedBox(width: 6.w),
                        CustomCachedImage(
                          imageUrl: subjectModel.profileImageUrl ?? '',
                          width: 26,
                          height: 26,
                          errorIconSize: 18,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Padding(
                    padding: const EdgeInsets.only(right: 11),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "${subjectModel.subjName}",
                          style: Styles.textStyle14,
                          textAlign: TextAlign.right,
                        ),
                        SizedBox(width: 5.w),
                        Icon(
                          Icons.menu_book_rounded,
                          color: kPrimaryColor,
                          size: 18.sp,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Padding(
                    padding: const EdgeInsets.only(right: 11),
                    child: Text(
                      "${subjectModel.level} / ${subjectModel.term == 1 ? 'الترم الأول' : 'الترم الثاني'}",
                      style: Styles.textStyle12,
                      textDirection: TextDirection.rtl,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Padding(
                    padding: const EdgeInsets.only(right: 11),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "${subjectModel.pricePerHour} جنيه",
                          style:
                              Styles.textStyle14.copyWith(color: kPrimaryColor),
                          textAlign: TextAlign.right,
                          textDirection: TextDirection.rtl,
                        ),
                        SizedBox(width: 5.w),
                        Text(
                          "سعر الحصة : ",
                          style: Styles.textStyle12,
                          textAlign: TextAlign.right,
                          textDirection: TextDirection.rtl,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

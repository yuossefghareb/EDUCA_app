import 'package:field_training_app/Core/models/subject_model.dart';
import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/utils/routes.dart';
import 'package:field_training_app/Core/utils/styles.dart';
import 'package:field_training_app/Core/utils/subject_image.dart';
import 'package:field_training_app/Core/widgets/custom_cached_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCoursesItem extends StatelessWidget {
  const MyCoursesItem({super.key, required this.subjectModel});
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
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(9, 0, 0, 0),
              blurRadius: 3.0,
            ),
          ],
          border: Border(
              left: BorderSide(color: Colors.grey.shade300, width: 0.5),
              right: BorderSide(color: Colors.grey.shade300, width: 0.5),
              bottom: BorderSide(color: Colors.grey.shade300, width: 0.6)),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 110,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.r),
                      topRight: Radius.circular(10.r),
                    ),
                    child: Image.asset(
                      subjectImage(subjectModel.subjName ?? ''),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w, top: 12.h, bottom: 5.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(subjectModel.teacherName ?? '',
                            style: Styles.textStyle14
                                .copyWith(fontWeight: FontWeight.bold)),
                        SizedBox(width: 6.w),
                        CustomCachedImage(
                            imageUrl: subjectModel.profileImageUrl ?? '',
                            height: 25.h,
                            width: 25.w,
                            loadingWidth: 20.w,
                            errorIconSize: 15),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Padding(
                    padding: const EdgeInsets.only(right: 14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          subjectModel.subjName ?? '',
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
                  SizedBox(height: 6.h),
                  Padding(
                    padding: const EdgeInsets.only(right: 14),
                    child: Text(
                      "${subjectModel.level ?? ''}  / ${subjectModel.term == 1 ? 'الترم الأول' : 'الترم الثاني'}",
                      style: Styles.textStyle14,
                      textAlign: TextAlign.right,
                    ),
                  ),
                  SizedBox(height: 6.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

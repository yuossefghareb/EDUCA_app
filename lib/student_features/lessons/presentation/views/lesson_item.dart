import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class LessonItem extends StatelessWidget {
  const LessonItem(
      {super.key,
      required this.name,
      required this.onTap,
      required this.index});
  final String name;
  final int index;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(6.r),
      splashColor: kSplashColor,
      child: Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.r),
            border: Border.all(color: Colors.grey[400]!),
          ),
          child: RichText(
            text: TextSpan(
              text: 'الدرس ${index + 1} : ',
              style: GoogleFonts.tajawal(
                  fontSize: 14.sp, color: Colors.black), // Default text style
              children: <TextSpan>[
                TextSpan(
                  text: name,
                  style: GoogleFonts.tajawal(
                      fontSize: 16.sp,
                      color: kPrimaryColor), // Blue color for the name
                ),
              ],
            ),
          )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/utils/constatnt.dart';
import '../../../../Core/utils/styles.dart';

class CustomClassOptionsShape extends StatelessWidget {
  const CustomClassOptionsShape({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      alignment: Alignment.center,
      width: double.infinity,
      height: 90.h,
      decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(90.r),
          )),
      child:
          Text(text, style: Styles.textStyle28.copyWith(color: Colors.white)),
    );
  }
}

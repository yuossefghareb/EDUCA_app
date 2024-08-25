import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onpressed,
    this.backroundcolor,
    this.rectangleBorder,
    this.textStyle,
    this.padding,
  });
  final String text;
  final VoidCallback onpressed;

  final Color? backroundcolor;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;

  final RoundedRectangleBorder? rectangleBorder;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpressed,
      style: ElevatedButton.styleFrom(
        elevation: 0.0,
        backgroundColor: backroundcolor ?? kPrimaryColor,
        foregroundColor: Colors.white,
        padding: padding ?? const EdgeInsets.only(bottom: 15, top: 17),
        shape: rectangleBorder ??
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.r),
            ),
      ),
      child: Text(
        text,
        style: textStyle ??
            Styles.textStyle20.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}

import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPopIconButton extends StatelessWidget {
  const CustomPopIconButton({super.key, this.backgroundColor, this.radius});
  final Color? backgroundColor;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(Icons.arrow_back_ios, color: kPrimaryColor, size: 21),
      style: IconButton.styleFrom(
          backgroundColor: backgroundColor ?? kSplashDarkerColor,
          padding: const EdgeInsets.only(left: 8),
          fixedSize: Size.fromRadius(radius ?? 20.r)),
    );
  }
}

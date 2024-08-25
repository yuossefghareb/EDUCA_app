import 'package:field_training_app/Core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentOptionItem extends StatelessWidget {
  const PaymentOptionItem(
      {super.key,
      required this.image,
      required this.onTap,
      required this.text});

  final String image;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10.r),
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        width: double.infinity,
        height: 210.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(color: Colors.grey[300]!)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image, width: 130.h, fit: BoxFit.fill),
            SizedBox(height: 18.h),
            Text(text, style: Styles.textStyle18),
          ],
        ),
      ),
    );
  }
}

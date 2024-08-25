import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class CustomSearchLoadingWidget extends StatelessWidget {
  const CustomSearchLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        "assets/animation/search.json",
        width: 250.w,
      ),
    );
  }
}

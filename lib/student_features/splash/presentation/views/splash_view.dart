import 'package:field_training_app/Core/api_services/end_points.dart';
import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/cache/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../Core/utils/routes.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  bool start = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 400), () {
      setState(() {
        start = true;
      });
    });

    Future.delayed(const Duration(milliseconds: 2000), () {
      Navigator.pushReplacementNamed(
        context,
        CacheHelper.getData(key: introScreenKey) == true
            ? CacheHelper.getData(key: ApiKey.id) != null
                ? CacheHelper.getData(key: ApiKey.role) == "Student"
                    ? Routes.customBottomBarViewRoute
                    : CacheHelper.getData(key: termsKey) == true
                        ? Routes.customBottomBarForTeacherViewRoute
                        : Routes.termsViewRoute
                : Routes.loginViewRoute
            : Routes.introScreensViewRoute,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: start == true
            ? Lottie.asset(
                "assets/animation/splash3.json",
                width: 300.w,
                repeat: true,
                frameRate: FrameRate.max,
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}

import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/utils/styles.dart';
import 'package:field_training_app/cache/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../../../Core/utils/routes.dart';

class IntroScreensBody extends StatelessWidget {
  const IntroScreensBody({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      animationDuration: 450,
      controlsPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
      showDoneButton: true,
      done: Text(
        "لنبدا",
        style: Styles.textStyle16.copyWith(fontWeight: FontWeight.bold),
      ),
      doneStyle: const ButtonStyle(
          foregroundColor: WidgetStatePropertyAll(Colors.white),
          backgroundColor: WidgetStatePropertyAll(kPrimaryColor)),
      onDone: () {
        CacheHelper.saveData(key: introScreenKey, value: true);
        Navigator.pushNamedAndRemoveUntil(
            context, Routes.loginViewRoute, (route) => false);
      },
      showNextButton: true,
      nextStyle: const ButtonStyle(
          foregroundColor: WidgetStatePropertyAll(Colors.white),
          backgroundColor: WidgetStatePropertyAll(kPrimaryColor)),
      next: Text(
        "التالي",
        style: Styles.textStyle16.copyWith(fontWeight: FontWeight.bold),
      ),
      showSkipButton: true,
      skip: Text(
        "تخطي",
        style: Styles.textStyle16
            .copyWith(color: kPrimaryColor, fontWeight: FontWeight.bold),
      ),
      onSkip: () {
        CacheHelper.saveData(key: introScreenKey, value: true);
        Navigator.pushNamedAndRemoveUntil(
            context, Routes.loginViewRoute, (route) => false);
      },
      pages: [
        PageViewModel(
          decoration: const PageDecoration(
              imageFlex: 2, imageAlignment: Alignment.center),
          title: "EDUCA مرحبا بك ف تطبيق",
          body:
              'ابحث بسهولة عن أفضل المعلمين واستعرض دوراتهم التعليمية المتنوعة',
          image: Image.asset(
            "assets/images/onB3.png",
            width: MediaQuery.of(context).size.width - 70.w,
            fit: BoxFit.fill,
          ),
        ),
        PageViewModel(
          decoration: const PageDecoration(
              imageFlex: 2, imageAlignment: Alignment.center),
          title: 'مساعدة على مدار الساعة',
          bodyWidget: Text(
            'احصل على المساعدة والإرشاد من ChatGPT في أي وقت وأي مكان.',
            style: Styles.textStyle16.copyWith(height: 1.7),
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
          ),
          image: Image.asset(
            "assets/images/onB2.png",
            width: MediaQuery.of(context).size.width - 80.w,
            fit: BoxFit.fill,
          ),
        ),
        PageViewModel(
          decoration: const PageDecoration(
              imageFlex: 2, imageAlignment: Alignment.center),
          title: 'اختبارات تفاعلية',
          body: 'اختبارات ممتعة لتقييم مستواك وتحسين مهاراتك في متناول يدك',
          image: Image.asset(
            "assets/images/onB1.png",
            width: MediaQuery.of(context).size.width - 50.w,
            fit: BoxFit.fill,
          ),
        ),
      ],
      dotsFlex: 2,
      dotsDecorator: DotsDecorator(
        size: const Size(7, 7),
        activeShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: const Color.fromARGB(255, 218, 218, 218),
        activeColor: kPrimaryColor,
        activeSize: const Size(24, 7),
      ),
    );
  }
}

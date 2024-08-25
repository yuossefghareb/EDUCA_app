import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:field_training_app/Core/utils/app_router.dart';
import 'package:field_training_app/Core/utils/app_services.dart';
import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/cache/cache_helper.dart';

import 'Core/utils/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  appServices();
  CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: MaterialApp(
            theme: ThemeData.light().copyWith(
              textTheme: GoogleFonts.tajawalTextTheme(
                ThemeData.light().textTheme,
              ),
              splashColor: kSplashColor,
            ),
            builder: (context, child) {
              return MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(textScaler: const TextScaler.linear(1.0)),
                child: child!,
              );
            },
            onGenerateRoute: AppRouter.generateRoute,
            initialRoute: Routes.splashViewRoute,
            debugShowCheckedModeBanner: false,
          ),
        );
      },
    );
  }
}

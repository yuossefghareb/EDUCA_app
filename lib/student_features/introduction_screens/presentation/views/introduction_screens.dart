import 'package:flutter/material.dart';
import '../widgets/introduction_screens_body.dart';

class IntroScreens extends StatelessWidget {
  const IntroScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: IntroScreensBody()),
    );
  }
}

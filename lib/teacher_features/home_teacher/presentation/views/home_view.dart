import 'package:flutter/material.dart';
import '../widgets/home_view_body.dart';

class HomeTeacherView extends StatelessWidget {
  const HomeTeacherView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: HomeTeacherViewBody()),
    );
  }
}

import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/student_features/bottom_bar/presentation/view_model/bottom_bar_cubit.dart';
import 'package:field_training_app/student_features/chat_gpt/presentation/views/chat_gpt_view.dart';

import 'package:field_training_app/teacher_features/courses/presentation/views/courser_teacher_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../../../home_teacher/presentation/views/home_view.dart';
import '../../../profile_teacher/presentation/views/teacher_profile_view.dart';

class CustomBottomBarForTeacherView extends StatelessWidget {
  const CustomBottomBarForTeacherView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomBarCubit, int>(
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              border: Border(
                  top: BorderSide(color: Colors.grey.shade200, width: 0.6)),
            ),
            child: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: GNav(
                  gap: 8,
                  selectedIndex: state,
                  tabBackgroundColor: kSplashColor,
                  activeColor: kPrimaryColor,
                  padding: const EdgeInsets.only(
                      left: 18, right: 16, top: 12, bottom: 12),
                  onTabChange: (value) {
                    BlocProvider.of<BottomBarCubit>(context)
                        .changeBottomBarIndex(value);
                  },
                  tabs: const [
                    GButton(
                      icon: Icons.account_circle_outlined,
                      text: "أنا",
                    ),
                    GButton(
                      icon: Icons.chat_outlined,
                      text: "ChatGPT",
                    ),
                    GButton(
                      icon: Icons.beenhere_outlined,
                      text: "موادي ",
                    ),
                    GButton(
                      icon: Icons.home_outlined,
                      text: "الرئيسية",
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: SafeArea(
              child: IndexedStack(
            index: state,
            children: const [
              TeacherProfileView(),
              ChatGPTView(),
              CoursesTeacherView(),
              HomeTeacherView()
            ],
          )),
        );
      },
    );
  }
}

// ignore_for_file: deprecated_member_use
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/student_features/chat_gpt/presentation/views/chat_gpt_view.dart';
import 'package:field_training_app/student_features/home/presentation/views/home_view.dart';
import 'package:field_training_app/student_features/courses/presentation/views/my_courses_view.dart';
import 'package:field_training_app/student_features/profile/presentation/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../view_model/bottom_bar_cubit.dart';

class CustomBottomBarView extends StatelessWidget {
  const CustomBottomBarView({super.key});

  _onbackButtonPressed(BuildContext context) async {
    bool? exitApp = await AwesomeDialog(
      context: context,
      dialogType: DialogType.infoReverse,
      animType: AnimType.rightSlide,
      title: 'حقاا؟',
      desc: 'هل تريد الخروج من التطبيق؟',
      btnCancelOnPress: () {},
      btnOkOnPress: () {
        SystemNavigator.pop();
      },
      btnOkText: 'نعم',
      btnCancelText: 'لا',
    ).show();

    return exitApp ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomBarCubit, int>(
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () => _onbackButtonPressed(context),
          child: Scaffold(
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                    top: BorderSide(color: Colors.grey.shade200, width: 0.6)),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: GNav(
                  gap: 8,
                  backgroundColor: Colors.white,
                  selectedIndex: state,
                  tabBackgroundColor: kSplashDarkerColor,
                  activeColor: kPrimaryColor,
                  padding: const EdgeInsets.only(
                      left: 18, right: 16, top: 12, bottom: 12),
                  onTabChange: (value) {
                    context.read<BottomBarCubit>().changeBottomBarIndex(value);
                  },
                  tabs: const [
                    GButton(
                      icon: Icons.account_circle_outlined,
                      iconSize: 27,
                      text: "أنا",
                    ),
                    GButton(
                      icon: Icons.chat_outlined,
                      text: "ChatGPT",
                    ),
                    GButton(
                      icon: Icons.beenhere_outlined,
                      text: "موادي الدراسية",
                    ),
                    GButton(
                      icon: Icons.home_outlined,
                      text: "الرئيسية",
                    ),
                  ],
                ),
              ),
            ),
            body: SafeArea(
                child: IndexedStack(
              index: state,
              children: const [
                ProfileView(),
                ChatGPTView(),
                MyCoursesView(),
                HomeView(),
              ],
            )),
          ),
        );
      },
    );
  }
}

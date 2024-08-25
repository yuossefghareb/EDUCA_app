import 'package:field_training_app/Core/utils/routes.dart';
import 'package:field_training_app/Core/utils/styles.dart';
import 'package:field_training_app/Core/widgets/pop_icon_button.dart';
import 'package:field_training_app/student_features/search/presentation/widgets/search_options_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchOptionsView extends StatelessWidget {
  const SearchOptionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(height: 15.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomPopIconButton(),
                    Text(
                      "بحث عن",
                      style: Styles.textStyle22,
                    ),
                  ],
                ),
                SizedBox(height: 25.h),
                SearchOptionItem(
                  text: "معلم",
                  image: "assets/images/teacher.png",
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      Routes.searchViewRoute,
                      arguments: "teacher",
                    );
                  },
                ),
                SizedBox(height: 20.h),
                SearchOptionItem(
                  text: "مادة دراسية",
                  image: "assets/images/books.png",
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      Routes.searchViewRoute,
                      arguments: "subject",
                    );
                  },
                ),
                SizedBox(height: 20.h),
                SearchOptionItem(
                  text: "مدرسين في محافظة",
                  image: "assets/images/group.png",
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      Routes.searchViewRoute,
                      arguments: "governate",
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

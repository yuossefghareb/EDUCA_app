import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeSearchTextFormField extends StatelessWidget {
  const HomeSearchTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: kPrimaryColor,
      cursorHeight: 30.h,
      cursorRadius: Radius.circular(10.r),
      textAlign: TextAlign.right,
      decoration: InputDecoration(
        hintText: "ابحث هنا",
        hintTextDirection: TextDirection.rtl,
        hintStyle: Styles.textStyle14.copyWith(color: kPrimaryColor),
        filled: true,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 17, horizontal: 16),
        fillColor: kSplashColor,
        suffixIcon: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: kPrimaryColor,
              size: 26,
            )),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide:
                const BorderSide(color: Color.fromRGBO(9, 96, 245, 0.128))),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: kPrimaryColor)),
      ),
    );
  }
}

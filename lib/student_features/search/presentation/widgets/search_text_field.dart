// ignore_for_file: must_be_immutable
import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/utils/styles.dart';
import 'package:field_training_app/Core/widgets/custom_cherry_toast.dart';
import 'package:field_training_app/student_features/search/presentation/view_model/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchTextFormField extends StatelessWidget {
  SearchTextFormField(
      {super.key, required this.searchType, this.governateState});

  TextEditingController controller = TextEditingController();
  final String searchType;
  final String? governateState;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: kPrimaryColor,
      cursorHeight: 30.h,
      cursorRadius: Radius.circular(10.r),
      textAlign: TextAlign.right,
      onFieldSubmitted: (value) {
        onPressedFunction(value.trim(), context);
      },
      decoration: InputDecoration(
        hintText: "ابحث هنا",
        hintTextDirection: TextDirection.rtl,
        hintStyle: Styles.textStyle14.copyWith(color: kPrimaryColor),
        filled: true,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 17, horizontal: 16),
        fillColor: kSplashColor,
        prefixIcon: IconButton(
            onPressed: () {
              onPressedFunction(controller.text.trim(), context);
            },
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

  void onPressedFunction(String value, BuildContext context) {
    if (value.isNotEmpty || value != "") {
      if (searchType == "teacher") {
        context.read<SearchCubit>().getSearchByTeacherName(value);
      } else if (searchType == "subject") {
        context.read<SearchCubit>().getSearchBySubjectName(value);
      } else {
        if (governateState == "أختر المحافظة") {
          errorCherryToast(context, "حدث خطأ", "يرجي اختيار المحافظة");
        } else {
          context
              .read<SearchCubit>()
              .getSearchByTeachersInGovernate(value, governateState ?? '');
        }
      }
    } else {
      errorCherryToast(context, "حدث خطأ", "حقل البحث فارغ");
    }
  }
}

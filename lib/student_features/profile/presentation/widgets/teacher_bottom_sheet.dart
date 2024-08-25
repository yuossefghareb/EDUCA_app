// ignore_for_file: use_build_context_synchronously
import 'package:field_training_app/Core/utils/routes.dart';
import 'package:field_training_app/Core/widgets/custom_cherry_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../Core/utils/constatnt.dart';
import '../../../../Core/utils/styles.dart';
import '../../../../teacher_features/profile_teacher/presentation/view_model/cubit/teacher_profile_cubit.dart';

void teacherBottomSheet(BuildContext context) {
  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext ctx) {
      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(top: 40),
        height: 190.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                IconButton(
                  onPressed: () async {
                    final picker = ImagePicker();
                    final pickedFile =
                        await picker.pickImage(source: ImageSource.camera);
                    if (pickedFile != null) {
                      context
                          .read<TeacherProfileCubit>()
                          .updateTeacherData(image: pickedFile);
                      Navigator.of(context).pop();
                      Navigator.pushReplacementNamed(
                          context, Routes.customBottomBarForTeacherViewRoute);
                      successCherryToast(context, 'تم تغيير الصورة',
                          'قم باعادة تشغيل البرنامج لعرض التحديثات');
                    }
                  },
                  icon: const Icon(
                    Icons.camera_alt,
                    size: 38,
                    color: kPrimaryColor,
                  ),
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(kSplashColor),
                    padding: WidgetStatePropertyAll(
                      EdgeInsets.all(12),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Text("الكاميرة", style: Styles.textStyle18),
              ],
            ),
            Column(
              children: [
                IconButton(
                  onPressed: () async {
                    final picker = ImagePicker();
                    final pickedFile =
                        await picker.pickImage(source: ImageSource.gallery);
                    if (pickedFile != null) {
                      context
                          .read<TeacherProfileCubit>()
                          .updateTeacherData(image: pickedFile);
                      Navigator.of(context).pop();
                      Navigator.pushReplacementNamed(
                          context, Routes.customBottomBarForTeacherViewRoute);
                      successCherryToast(context, 'تم تغيير الصورة',
                          'قم باعادة تشغيل البرنامج لعرض التحديثات');
                    }
                  },
                  icon: const Icon(
                    Icons.photo,
                    size: 38,
                    color: kPrimaryColor,
                  ),
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(kSplashColor),
                    padding: WidgetStatePropertyAll(
                      EdgeInsets.all(12),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Text("المعرض", style: Styles.textStyle18),
              ],
            ),
          ],
        ),
      );
    },
  );
}

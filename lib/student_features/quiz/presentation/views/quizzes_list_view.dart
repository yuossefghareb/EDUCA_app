import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/utils/routes.dart';
import 'package:field_training_app/Core/utils/styles.dart';
import 'package:field_training_app/Core/widgets/custom_failure_widget.dart';
import 'package:field_training_app/Core/widgets/custom_loading_widget.dart';
import 'package:field_training_app/Core/widgets/pop_icon_button.dart';
import 'package:field_training_app/student_features/quiz/presentation/view_model/quiz_cubit/quiz_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuizzesListView extends StatelessWidget {
  const QuizzesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: CustomPopIconButton(
          backgroundColor: Colors.white70,
          radius: 18.r,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text("الأختبارات",
                style: Styles.textStyle18.copyWith(color: Colors.white)),
          ),
          SizedBox(width: 14.w),
        ],
        elevation: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: 60,
      ),
      body: BlocBuilder<QuizCubit, QuizState>(
        builder: (context, state) {
          if (state is QuizSuccess) {
            return state.quizzes.isNotEmpty
                ? ListView.builder(
                    itemCount: state.quizzes.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 8),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, Routes.quizViewRoute,
                                arguments: state.quizzes[index].id);
                          },
                          splashColor: kSplashColor,
                          borderRadius: BorderRadius.circular(8.r),
                          child: Container(
                            alignment: Alignment.centerRight,
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 14),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey[400]!),
                                borderRadius: BorderRadius.circular(8.r)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "${index + 1} الأختبار",
                                  style: Styles.textStyle16,
                                ),
                                SizedBox(height: 5.h),
                                state.quizzes[index].description != null
                                    ? Text(
                                        state.quizzes[index].description!,
                                      )
                                    : const SizedBox.shrink(),
                                state.quizzes[index].description != null
                                    ? SizedBox(height: 5.h)
                                    : const SizedBox.shrink(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      state.quizzes[index].createdDate!
                                          .substring(0, 10),
                                      style: Styles.textStyle12,
                                    ),
                                    Text(' : تاريخ الأنشاء',
                                        style: Styles.textStyle12),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : const Center(
                    child: Text('لا يوجد أختبارات لهذه المادة'),
                  );
          } else if (state is QuizFaliure) {
            return const CustomFailureWidget(
                errMessage: 'حدث خطأ أثناء الحصول على الأختبارات');
          }
          return const CustomLoadingWidget();
        },
      ),
    );
  }
}

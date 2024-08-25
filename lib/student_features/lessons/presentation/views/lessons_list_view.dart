import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/utils/routes.dart';
import 'package:field_training_app/Core/widgets/custom_failure_widget.dart';
import 'package:field_training_app/Core/widgets/custom_loading_widget.dart';
import 'package:field_training_app/Core/widgets/pop_icon_button.dart';
import 'package:field_training_app/student_features/lessons/presentation/view_model/cubit/lessons_cubit.dart';
import 'package:field_training_app/student_features/lessons/presentation/views/lesson_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/utils/styles.dart';

class LessonsListView extends StatelessWidget {
  const LessonsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title:
            CustomPopIconButton(backgroundColor: Colors.white70, radius: 18.r),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text("الدروس",
                style: Styles.textStyle18.copyWith(color: Colors.white),),
          ),
          SizedBox(width: 14.w),
        ],
        elevation: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: 60,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: BlocBuilder<LessonsCubit, LessonsState>(
          builder: (context, state) {
            if (state is LessonsSuccess) {
              return state.lessons.isNotEmpty
                  ? ListView.builder(
                      itemCount: state.lessons.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: LessonItem(
                                name: state.lessons[index].name!,
                                index: index,
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    Routes.lessonDetailsViewRoute,
                                    arguments: state.lessons[index].id,
                                  );
                                }));
                      },
                    )
                  : const Center(child: Text('لا يوجد دروس'));
            } else if (state is LessonsFailure) {
              return CustomFailureWidget(errMessage: state.errMessage);
            }
            return const CustomLoadingWidget();
          },
        ),
      ),
    );
  }
}

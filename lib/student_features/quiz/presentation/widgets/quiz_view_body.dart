import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/utils/styles.dart';
import 'package:field_training_app/Core/widgets/custom_button.dart';
import 'package:field_training_app/Core/widgets/custom_failure_widget.dart';
import 'package:field_training_app/Core/widgets/custom_loading_widget.dart';
import 'package:field_training_app/student_features/quiz/presentation/view_model/counter_cubit.dart';
import 'package:field_training_app/student_features/quiz/presentation/view_model/quiz_cubit/quiz_cubit.dart';
import 'package:field_training_app/student_features/quiz/presentation/widgets/calculate_correct_answers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/utils/routes.dart';
import 'question_and_answers.dart';

class QuizViewBody extends StatelessWidget {
  QuizViewBody({super.key, required this.quizID});
  final int quizID;
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizCubit, QuizState>(
      builder: (context, state) {
        if (state is QuestionSuccess) {
          correctAnswersList =
              List.generate(state.questionList.length, (index) => '');
          studentAnswersList =
              List.generate(state.questionList.length, (index) => '');
          return Stack(
            alignment: Alignment.center,
            fit: StackFit.expand,
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      SizedBox(height: 60.h),
                      SizedBox(
                        height: MediaQuery.of(context).size.height - 160.h,
                        child: state.questionList.isEmpty
                            ? const Center(child: Text('للأسف لا توجد أسئلة'))
                            : PageView.builder(
                                reverse: true,
                                physics: const NeverScrollableScrollPhysics(),
                                controller: _controller,
                                itemCount: state.questionList.length,
                                itemBuilder: (context, index) {
                                  correctAnswersList[index] =
                                      state.questionList[index].correctAnswer;
                                  return QuestionAndAnswer(
                                    questionModel: state.questionList[index],
                                    questionIndex: index,
                                    answers: [
                                      state.questionList[index].option1,
                                      state.questionList[index].option2,
                                      state.questionList[index].option3,
                                      state.questionList[index].option4
                                    ],
                                  );
                                },
                              ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 20.h,
                right: 20.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    BlocBuilder<CounterCubit, double>(
                      builder: (context, state) {
                        return Text((state.toInt() + 1).toString(),
                            style: Styles.textStyle22
                                .copyWith(color: kPrimaryColor));
                      },
                    ),
                    Text(" / ${state.questionList.length}",
                        style: Styles.textStyle16),
                  ],
                ),
              ),
              Positioned(
                bottom: 20.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton(
                      text: "التالي",
                      onpressed: () {
                        if (_controller.page! < state.questionList.length - 1) {
                          _controller
                              .nextPage(
                                duration: const Duration(milliseconds: 600),
                                curve: Curves.ease,
                              )
                              .then((value) => context
                                  .read<CounterCubit>()
                                  .increment(_controller.page!));
                        } else {
                          int quizResult = calculateCorrectAnswers(
                              studentAnswersList,
                              correctAnswersList,
                              state.questionList.length);
                          Navigator.pushReplacementNamed(
                            context,
                            Routes.quizResultViewRoute,
                            arguments: [
                              state.questionList.length,
                              quizResult,
                              quizID
                            ],
                          );
                          correctAnswersList.clear();
                          studentAnswersList.clear();
                        }
                      },
                      textStyle: Styles.textStyle18
                          .copyWith(fontWeight: FontWeight.bold),
                      padding: EdgeInsets.only(
                          left: 40.w, right: 40.w, top: 12.h, bottom: 8.h),
                    ),
                    SizedBox(width: 110.w),
                    CustomButton(
                      text: "السابق",
                      onpressed: () {
                        if (_controller.page! > 0) {
                          _controller
                              .previousPage(
                                duration: const Duration(milliseconds: 600),
                                curve: Curves.ease,
                              )
                              .then((value) => context
                                  .read<CounterCubit>()
                                  .decrement(_controller.page!));
                        }
                      },
                      textStyle: Styles.textStyle18
                          .copyWith(fontWeight: FontWeight.bold),
                      padding: EdgeInsets.only(
                          left: 30.w, right: 30.w, top: 12.h, bottom: 8.h),
                    ),
                  ],
                ),
              ),
            ],
          );
        } else if (state is QuestionFaliure) {
          return const CustomFailureWidget(errMessage: 'حدث خطأ ما');
        }
        return const CustomLoadingWidget();
      },
    );
  }
}

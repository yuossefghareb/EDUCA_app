import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:field_training_app/Core/models/quiz_model.dart';
import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/utils/routes.dart';
import 'package:field_training_app/Core/utils/styles.dart';
import 'package:field_training_app/Core/widgets/custom_button.dart';
import 'package:field_training_app/Core/widgets/custom_cherry_toast.dart';
import 'package:field_training_app/Core/widgets/custom_loading_widget.dart';
import 'package:field_training_app/teacher_features/make_quiz/presentation/views_model/add_quiz_cubit/add_quiz_cubit.dart';

class ShowAllQuizzesListViewBuilder extends StatefulWidget {
  const ShowAllQuizzesListViewBuilder({super.key, required this.subjectId});

  final int subjectId;

  @override
  State<ShowAllQuizzesListViewBuilder> createState() =>
      _ShowAllQuizzesListViewBuilderState();
}

class _ShowAllQuizzesListViewBuilderState
    extends State<ShowAllQuizzesListViewBuilder> {
  final TextEditingController controller = TextEditingController();

  List<QuizModel> allquizzes = [];
  @override
  void initState() {
    
    super.initState();
    BlocProvider.of<AddQuizCubit>(context)
        .getAllQuiz(subjectId: widget.subjectId);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 10.h),
        blocBuilderGetAllQuizzes(),
        blocConsumerAddQuiz(),
      ],  
    );
  }

  BlocConsumer<AddQuizCubit, AddQuizState> blocConsumerAddQuiz() {
    return BlocConsumer<AddQuizCubit, AddQuizState>(
      listener: (context, state) {
        if (state is AddQuizSuccess) {
          successCherryToast(
              context, 'تمت العملية بنجاح', 'تم اضافة الاختبار بنجاح');
          Navigator.of(context).pop();
          Navigator.of(context).pushReplacementNamed(
            Routes.createQuizViewRoute,
            arguments: {
              "quizId": state.quizModel.id,
              "titleQuiz": controller.text,
              "subjectId": widget.subjectId,
            },
          );
        } else if (state is AddQuizFailure) {
          errorCherryToast(context, 'خطأ', 'خطأ في عملية الاضافة');
        }
      },
      builder: (context, state) {
        return state is AddQuizLoading
            ? const CustomLoadingWidget()
            : Padding(
                padding: const EdgeInsets.only(bottom: 24, right: 20, left: 20),
                child: CustomButton(
                  onpressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: const Text("اضافة اختبار جديد"),
                        content: TextField(
                          decoration: const InputDecoration(
                            labelText: "اسم الاختبار",
                          ),
                          controller: controller,
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              if (controller.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content:
                                        Text("يجب عليك ادخال اسم الاختبار"),
                                  ),
                                );
                              } else {
                                context.read<AddQuizCubit>().addQuiz(
                                    title: controller.text,
                                    subjectId: widget.subjectId);
                              }
                            },
                            child: const Text("اضافة"),
                          ),
                        ],
                      ),
                    );
                  },
                  text: 'اضافة اختبار',
                ),
              );
      },
    );
  }

  BlocBuilder<AddQuizCubit, AddQuizState> blocBuilderGetAllQuizzes() {
    return BlocBuilder<AddQuizCubit, AddQuizState>(
      builder: (context, state) {
        if (state is GetAllQuizLoading) {
          return const CustomLoadingWidget();
        } else {
          if (state is GetAllQuizSuccess) allquizzes = (state).quizModelList;
          return allquizzes.isEmpty
              ? emptyQuizzes()
              : listViewAllQuizz();
        }
      },
    );
  }

  Expanded emptyQuizzes() {
    return const Expanded(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.question_answer_outlined,
                    size: 50,
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: Text(
                      '   لا يوجد اختبارات لهذه المادة \nاضف اختبار ',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ],
              ));
  }

  Expanded listViewAllQuizz() {
    return Expanded(
                child: ListView.builder(
                    itemCount: allquizzes.length,
                    itemBuilder: (context, index) {
                      var quizModel = allquizzes[index];
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, Routes.showQuizViewRoute,
                              arguments: {
                                "quizId": quizModel.id,
                                "subjectId": quizModel.subjectId,
                                "titleQuiz": quizModel.description,
                              });
                        },
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: ListTile(
                            leading: const Icon(Icons.description_outlined),
                            title: Text(quizModel.description ?? ""),
                            subtitle: Row(
                              children: [
                                Text(
                                  quizModel.createdDate
                                      .toString()
                                      .substring(0, 10),
                                  style: Styles.textStyle14,
                                ),
                                const Spacer(),
                                //const Text('10 اسئلة'),
                              ],
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, Routes.showQuizViewRoute,
                                        arguments: {
                                          "quizId": quizModel.id,
                                          "subjectId": quizModel.subjectId,
                                          "titleQuiz": quizModel.description,
                                        });
                                  },
                                  icon: const Icon(
                                    Icons.edit_outlined,
                                    color: kPrimaryColor,
                                  ),
                                ),
                                BlocConsumer<AddQuizCubit, AddQuizState>(
                                  listener: (context, state) {},
                                  builder: (context, state) {
                                    return IconButton(
                                      onPressed: () {
                                        context
                                            .read<AddQuizCubit>()
                                            .deleteQuiz(
                                                quizId: quizModel.id!);
                                        allquizzes.remove(quizModel);
                                        BlocProvider.of<AddQuizCubit>(context)
                                            .getAllQuiz(
                                                subjectId: quizModel.subjectId
                                                    as int);
                                      },
                                      icon: const Icon(
                                        Icons.delete_outlined,
                                        color: kPrimaryColor,
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              );
  }
}

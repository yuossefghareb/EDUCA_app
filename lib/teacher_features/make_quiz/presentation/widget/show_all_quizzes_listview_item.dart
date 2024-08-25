// import 'package:field_training_app/Core/models/quiz_model.dart';
// import 'package:field_training_app/Core/utils/constatnt.dart';
// import 'package:field_training_app/Core/utils/routes.dart';
// import 'package:field_training_app/Core/utils/styles.dart';
// import 'package:field_training_app/Core/widgets/custom_cherry_toast.dart';

// import 'package:field_training_app/teacher_features/make_quiz/presentation/views_model/add_quiz_cubit/add_quiz_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class ShowAllQuizzesListViewItem extends StatelessWidget {
//   const ShowAllQuizzesListViewItem({
//     super.key,
//     required this.quizModel,
//   });
//   final QuizModel quizModel;

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         Navigator.pushNamed(context, Routes.showQuizViewRoute, arguments: {
//           "quizId": quizModel.id,
//           "subjectId": quizModel.subjectId,
//           "titleQuiz": quizModel.description,
//         });
//       },
//       child: Directionality(
//         textDirection: TextDirection.rtl,
//         child: ListTile(
//           leading: const Icon(Icons.description_outlined),
//           title: Text(quizModel.description ?? ""),
//           subtitle: Row(
//             children: [
//               Text(
//                 quizModel.createdDate.toString().substring(0, 10),
//                 style: Styles.textStyle14,
//               ),
//               const Spacer(),
//               //const Text('10 اسئلة'),
//             ],
//           ),
//           trailing: Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               IconButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, Routes.showQuizViewRoute,
//                       arguments: {
//                         "quizId": quizModel.id,
//                         "subjectId": quizModel.subjectId,
//                         "titleQuiz": quizModel.description,
//                       });
//                 },
//                 icon: const Icon(
//                   Icons.edit_outlined,
//                   color: kPrimaryColor,
//                 ),
//               ),
//               BlocConsumer<AddQuizCubit, AddQuizState>(
//                 listener: (context, state) {
                  
//                 },
//                 builder: (context, state) {
//                   return  IconButton(
//                     onPressed: () {
//                       context
//                           .read<AddQuizCubit>()
//                           .deleteQuiz(quizId: quizModel.id!);
//                       BlocProvider.of<AddQuizCubit>(context).getAllQuiz(
//                         subjectId: quizModel.subjectId as int
//                       );
//                     },
//                     icon: const Icon(
//                       Icons.delete_outlined,
//                       color: kPrimaryColor,
//                     ),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

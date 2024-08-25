// import 'package:field_training_app/Core/utils/app_services.dart';
// import 'package:field_training_app/Core/utils/styles.dart';
// import 'package:field_training_app/Core/widgets/custom_loading_widget.dart';
// import 'package:field_training_app/student_features/lessons/presentation/widgets/convert_to_pdf_function.dart';
// import 'package:field_training_app/student_features/lessons/presentation/widgets/detect_file_type_function.dart';
// import 'package:field_training_app/student_features/lessons/presentation/widgets/lesson_detail_item.dart';
// import 'package:field_training_app/teacher_features/courses/data/repos/chapter_files_repo/chapter_files_repo_implement.dart';

// import 'package:field_training_app/teacher_features/courses/presentation/views_model/get_file_cubit/get_files_cubit.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class MediaListView extends StatelessWidget {
//   const MediaListView({
//     super.key,
//     required this.chapterId,
//   });
//   final int chapterId;

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => GetFilesCubit(getIt<ChapterFilesRepoImplement>())
//         ..getFiles(chapterId: chapterId),
//       child: BlocConsumer<GetFilesCubit, GetFilesState>(
//         listener: (context, state) {},
//         builder: (context, state) {
//           if (state is GetFilesFailure) {
//             return SliverToBoxAdapter(
//                 child: Center(
//               child: Text(
//                 'لا يوجد ملفات',
//                 style: Styles.textStyle20.copyWith(),
//               ),
//             ));
//           } else if (state is GetFilesSuccess) {
//             return SliverGrid(
//                 delegate: SliverChildBuilderDelegate(
//                   childCount: state.files.length,
//                   (context, index) {
//                     return Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 10),
//                       child: LessonDetailItem(
//                         name: state.files[index].fileName!,
//                         ontap: () {
//                           convertToPDF(
//                               base64Content: state.files[index].fileContent!,
//                               fileName: state.files[index].fileName!);
//                         },
//                         type: fileTypeDetect(
//                             contentType: state.files[index].contentType!),
//                       ),
//                     );
//                   },
//                 ),
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   mainAxisSpacing: 0,
//                   crossAxisSpacing: 16,
//                 ));
//           } else {
//             return const SliverToBoxAdapter(child: CustomLoadingWidget());
//           }
//         },
//       ),
//     );
//   }
// }


import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:field_training_app/Core/utils/app_services.dart';
import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/utils/routes.dart';
import 'package:field_training_app/Core/utils/styles.dart';
import 'package:field_training_app/Core/widgets/custom_button.dart';
import 'package:field_training_app/Core/widgets/custom_cherry_toast.dart';
import 'package:field_training_app/Core/widgets/custom_loading_widget.dart';
import 'package:field_training_app/student_features/lessons/presentation/widgets/convert_to_pdf_function.dart';
import 'package:field_training_app/student_features/lessons/presentation/widgets/detect_file_type_function.dart';
import 'package:field_training_app/student_features/lessons/presentation/widgets/lesson_detail_item.dart';
import 'package:field_training_app/teacher_features/courses/data/models/file_model.dart';
import 'package:field_training_app/teacher_features/courses/data/repos/chapter_files_repo/chapter_files_repo_implement.dart';
import 'package:field_training_app/teacher_features/courses/presentation/views_model/add_chapter_cubit/add_chapter_cubit.dart';
import 'package:field_training_app/teacher_features/courses/presentation/views_model/drop_down_list_chapter_cubit.dart';
import 'package:field_training_app/teacher_features/courses/presentation/views_model/get_all_chapters_cubit/get_all_chapters_cubit.dart';
import 'package:field_training_app/teacher_features/courses/presentation/views_model/get_file_cubit/get_files_cubit.dart';
import 'package:field_training_app/teacher_features/courses/presentation/views_model/upload_file_cubit/upload_file_cubit.dart';

class CourseEditViewBody extends StatefulWidget {
  const CourseEditViewBody(
      {super.key,
      required this.subjectId,
      required this.chaptersN,
      required this.chapterIndex,
      required this.chapterId,
      required this.namech});
  final int subjectId;
  final List<String> chaptersN;
  final Map<String, int> chapterIndex;
  final int chapterId;
  final String namech;

  @override
  State<CourseEditViewBody> createState() => _CourseEditViewBodyState();
}

class _CourseEditViewBodyState extends State<CourseEditViewBody> {
  TextEditingController controller = TextEditingController();

  List<FileModel> allfiles = [];

  @override
  void initState() {
    if (widget.chapterId != -1) {
      context.read<DropDownListChapterCubit>().changeIndexDropDownListChapter(
            ch: widget.namech,
          );
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.chapterId == -1
        ? blocProviderEmptyPage()
        : Container(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              children: [
                Expanded(
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Text(
                          'الدرس ',
                          textDirection: TextDirection.rtl,
                          style: Styles.textStyle18
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      SliverToBoxAdapter(child: SizedBox(height: 10.w)),
                      dropDownListChapters(),
                      SliverToBoxAdapter(child: SizedBox(height: 20.h)),
                      const SliverToBoxAdapter(
                        child: Divider(
                          thickness: 2,
                        ),
                      ),
                      SliverToBoxAdapter(child: SizedBox(height: 20.h)),
                      SliverToBoxAdapter(
                        child: Text(
                          'الميديا',
                          textDirection: TextDirection.rtl,
                          style: Styles.textStyle18
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      mediaListView(context),
                      SliverToBoxAdapter(child: SizedBox(height: 2000.h)),
                    ],
                  ),
                ),
                actionButton()
              ],
            ),
          );
  }
//Culpa minim elit dolor officia dolore Lorem nulla excepteur aute irure laboris dolore. Labore proident id consequat adipisicing ipsum occaecat incididunt laborum proident do anim. Dolor est enim do consequat tempor nulla veniam labore ea. Qui duis consequat ea commodo ea magna. Dolore eiusmod cillum dolor irure enim cillum ex fugiat labore velit esse irure. Deserunt ullamco esse pariatur ea sit cupidatat voluptate enim eiusmod est magna. Sint id deserunt nisi sit.
  mediaListView(BuildContext context) {
    var chapterId =
        widget.chapterIndex[context.read<DropDownListChapterCubit>().state]!;

    return BlocProvider(
      create: (context) => GetFilesCubit(getIt<ChapterFilesRepoImplement>())
        ..getFiles(chapterId: chapterId),
      child: BlocConsumer<GetFilesCubit, GetFilesState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is GetFilesFailure) {
            return SliverToBoxAdapter(
                child: Center(
              child: Text(
                'لا يوجد ملفات',
                style: Styles.textStyle20.copyWith(),
              ),
            ));
          } else if (state is GetFilesSuccess) {
            allfiles = (state).files;
            return SliverGrid(
              delegate: SliverChildBuilderDelegate(
                childCount: allfiles.length,
                (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: LessonDetailItem(
                      name: allfiles[index].fileName!,
                      ontap: () {
                        convertToPDF(
                            base64Content: allfiles[index].fileContent!,
                            fileName: allfiles[index].fileName!);
                      },
                      type: fileTypeDetect(
                          contentType: allfiles[index].contentType!),
                    ),
                  );
                },
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 0,
                crossAxisSpacing: 16,
              ),
            );
          } else {
            return const SliverToBoxAdapter(child: CustomLoadingWidget());
          }
        },
      ),
    );
  }

  Row actionButton() {
   
    return Row(
      children: [
        Expanded(
            child: BlocProvider(
          create: (context) =>
              AddChapterCubit(getIt.get<ChapterFilesRepoImplement>()),
          child: BlocConsumer<AddChapterCubit, AddChapterState>(
            listener: (context, state) {
              if (state is AddChapterSuccess) {
                successCherryToast(
                  context,
                  "عملية ناجحة",
                  "${state.chapterModel.name}",
                );
                Navigator.pop(context);
              } else if (state is AddChapterFailure) {
                errorCherryToast(context, "حدث خطأ", state.message);
              }
            },
            builder: (context, state) {
              return state is AddChapterLoading
                  ? const CustomLoadingWidget()
                  : CustomButton(
                      text: 'درس جديد',
                      onpressed: () {
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: const Text("اضافة درس جديد"),
                            content: TextField(
                              decoration: const InputDecoration(
                                labelText: "اسم الدرس",
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
                                            Text("يجب عليك ادخال اسم الدرس"),
                                      ),
                                    );
                                  } else {
                                    BlocProvider.of<AddChapterCubit>(context)
                                        .addChapter(
                                            name: controller.text,
                                            subjectId: widget.subjectId);
                                    Navigator.pop(context);
                                    controller.clear();
                                  }
                                },
                                child: const Text("اضافة"),
                              ),
                            ],
                          ),
                        );
                      },
                      backroundcolor: kBackgroundColor,
                      textStyle: Styles.textStyle20.copyWith(
                          color: kPrimaryColor, fontWeight: FontWeight.bold),
                      rectangleBorder: RoundedRectangleBorder(
                        side: const BorderSide(color: kPrimaryColor),
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                    );
            },
          ),
        )),
        SizedBox(width: 10.w),
        BlocProvider(
          create: (context) =>
              UploadFileCubit(getIt<ChapterFilesRepoImplement>()),
          child: Expanded(
              child: BlocConsumer<UploadFileCubit, UploadFileState>(
            listener: (context, state) {
              if (state is UploadFileSuccess) {
                successCherryToast(
                  context,
                  "عملية ناجحة",
                  "تم انشاء المادة بنجاح",
                );

                // Navigator.pushReplacementNamed(
                //     context, Routes.courseEditViewRoute,
                //     arguments: {
                //       "namech": widget.namech,
                //       "subjectId": widget.subjectId,
                //       "chaptersN": widget.chaptersN,
                //       "chapterIndx": widget.chapterIndex,
                //       "chapterId": widget.chapterId
                //     });
              } else if (state is UploadFileFailure) {
                errorCherryToast(context, "حدث خطأ", state.message);
              }
            },
            builder: (context, state) {
              return state is UploadFileLoading
                  ? const CustomLoadingWidget()
                  : CustomButton(
                      text: 'اضافة ميديا',
                      onpressed: () async {
                        final result = await FilePicker.platform.pickFiles();
                        if (result != null) {
                          BlocProvider.of<UploadFileCubit>(context).uploadFile(
                              chapterId: widget.chapterId,
                              file: File(result.files.first.path!));
                        
                        } else {}
                      },
                      backroundcolor: kBackgroundColor,
                      textStyle: Styles.textStyle20.copyWith(
                          color: kPrimaryColor, fontWeight: FontWeight.bold),
                      rectangleBorder: RoundedRectangleBorder(
                        side: const BorderSide(color: kPrimaryColor),
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                    );
            },
          )),
        ),
      ],
    );
  }

  SliverToBoxAdapter dropDownListChapters() {
    return SliverToBoxAdapter(
      child: Container(
        height: 55.h,
        decoration: BoxDecoration(
          color: kBackgroundColor,
          borderRadius: BorderRadius.circular(4.r),
          border: Border.all(color: Colors.black12),
        ),
        child: BlocBuilder<DropDownListChapterCubit, String>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PopupMenuButton(
                    color: Colors.white,
                    icon: const Icon(
                      Icons.expand_more,
                      color: Colors.black,
                      size: 32,
                    ),
                    onSelected: (value) {
                      BlocProvider.of<DropDownListChapterCubit>(context)
                          .changeIndexDropDownListChapter(
                              ispusing: true,
                              ch: value,
                              context: context,
                              subjectId: widget.subjectId,
                              chaptersN: widget.chaptersN,
                              chapterIndx: widget.chapterIndex,
                              chapterId: widget.chapterId);
                    },
                    itemBuilder: (BuildContext bc) {
                      return widget.chaptersN.map((String item) {
                        return PopupMenuItem<String>(
                          value: item,
                          child: Text(item),
                        );
                      }).toList();
                    }),
                SizedBox(width: 5.w),
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Text(
                    state,
                    textDirection: TextDirection.rtl,
                    style: Styles.textStyle14.copyWith(color: Colors.black),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  BlocProvider<AddChapterCubit> blocProviderEmptyPage() {
    return BlocProvider(
      create: (context) =>
          AddChapterCubit(getIt.get<ChapterFilesRepoImplement>()),
      child: BlocConsumer<AddChapterCubit, AddChapterState>(
        listener: (context, state) {
          if (state is AddChapterSuccess) {
            successCherryToast(
                context, "تم الاضافة بنجاح", "تمت عملية الاضافة بنجاح");
            Navigator.pushReplacementNamed(context, Routes.courseEditViewRoute,
                arguments: {
                  "subjectId": widget.subjectId,
                  "chaptersN": context.read<GetAllChaptersCubit>().chapterNames,
                  "chapterIndx":
                      context.read<GetAllChaptersCubit>().chapterIndx,
                  "chapterId": state.chapterModel.id,
                  "namech": state.chapterModel.name,
                });
          }
        },
        builder: (context, state) {
          return InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: const Text("اضافة درس جديد"),
                  content: TextField(
                    decoration: const InputDecoration(
                      labelText: "اسم الدرس",
                    ),
                    controller: controller,
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        if (controller.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("يجب عليك ادخال اسم الملف"),
                            ),
                          );
                        } else {
                          BlocProvider.of<AddChapterCubit>(context).addChapter(
                              name: controller.text,
                              subjectId: widget.subjectId);
                          Navigator.pop(context);
                          controller.clear();
                        }
                      },
                      child: const Text("اضافة"),
                    ),
                  ],
                ),
              );
            },
            child: Center(
              child: Text(
                'لا يوجد درس \n, اضغط لا الدرس ',
                textDirection: TextDirection.rtl,
                style: Styles.textStyle18.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          );
        },
      ),
    );
  }
}

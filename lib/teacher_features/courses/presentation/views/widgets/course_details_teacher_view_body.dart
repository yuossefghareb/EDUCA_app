import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:field_training_app/Core/utils/app_services.dart';
import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/utils/styles.dart';
import 'package:field_training_app/Core/widgets/custom_button.dart';
import 'package:field_training_app/Core/widgets/custom_cherry_toast.dart';
import 'package:field_training_app/Core/widgets/custom_loading_widget.dart';
import 'package:field_training_app/Core/widgets/pop_icon_button.dart';
import 'package:field_training_app/teacher_features/courses/data/models/course_model.dart';
import 'package:field_training_app/teacher_features/courses/data/repos/course_repo/course_repo_implement.dart';
import 'package:field_training_app/teacher_features/courses/presentation/views/widgets/classes_and_subclasses_listview.dart';
import 'package:field_training_app/teacher_features/courses/presentation/views_model/get_all_chapters_cubit/get_all_chapters_cubit.dart';
import 'package:field_training_app/teacher_features/courses/presentation/views_model/get_all_courses_cubit/get_all_courses_teacher_cubit.dart';
import 'package:field_training_app/teacher_features/courses/presentation/views_model/swith_select_cubit.dart';

import '../../../../../Core/utils/routes.dart';

class CourseDetailsTeacherViewBody extends StatefulWidget {
  const CourseDetailsTeacherViewBody({super.key, required this.courseModel});

  final CourseModel courseModel;

  @override
  State<CourseDetailsTeacherViewBody> createState() =>
      _CourseDetailsTeacherViewBodyState();
}

class _CourseDetailsTeacherViewBodyState
    extends State<CourseDetailsTeacherViewBody> {
  @override
  void initState() {
    context.read<SwithSelectCubit>().isactive = widget.courseModel.isActive!;

    super.initState();
  }

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: CustomScrollView(
            slivers: [
              sliverAppBar(context),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 20.h,
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          blocBuilderSwitchIsActive(),
                          widget.courseModel.addingTime != null
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                        widget.courseModel.addingTime!
                                            .substring(0, 10),
                                        style: Styles.textStyle14),
                                    SizedBox(width: 10.w),
                                    Text(
                                      ' : تاريخ الأنشاء',
                                      style: Styles.textStyle12.copyWith(
                                          color: Colors.grey.shade700),
                                    ),
                                  ],
                                )
                              : const SizedBox.shrink(),
                        ],
                      ),
                      widget.courseModel.addingTime != null
                          ? SizedBox(height: 22.h)
                          : const SizedBox.shrink(),
                      courseDetails(),
                      SizedBox(height: 20.h),
                      blocProviderUpdatePrice(),
                      SizedBox(height: 20.h),
                      actionButton(context),
                      SizedBox(height: 25.h),
                      Text(
                        "الدروس",
                        style: Styles.textStyle18
                            .copyWith(fontWeight: FontWeight.bold),
                        textDirection: TextDirection.rtl,
                      ),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ),
              blocBuilderGetAllChapter(),
              SliverToBoxAdapter(child: SizedBox(height: 10.h)),
            ],
          ),
        ),
        editCourseButton(context)
      ],
    );
  }

  // ! methods and widgets

  BlocBuilder<GetAllChaptersCubit, GetAllChaptersState>
      blocBuilderGetAllChapter() {
    return BlocBuilder<GetAllChaptersCubit, GetAllChaptersState>(
      builder: (context, state) {
        if (state is GetAllChaptersFailure) {
          return const SliverToBoxAdapter(
            child: Center(
              child: Text(
                'لا يوجد دروس , اضف درس',
                style: TextStyle(
                  fontSize: 25,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          );
        } else if (state is GetAllChaptersSuccess) {
          return ClassesAndSubClassesListViews(
            chaptersList: state.chaptersList,
          );
        } else {
          return const SliverToBoxAdapter(child: CustomLoadingWidget());
        }
      },
    );
  }

  Padding editCourseButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: CustomButton(
          text: "تعديل المادة",
          onpressed: () {
            if (context.read<GetAllChaptersCubit>().chapterNames.isEmpty) {
              Navigator.pushNamed(context, Routes.courseEditViewRoute,
                  arguments: {
                    "subjectId": widget.courseModel.subjectId,
                    "chaptersN":
                        context.read<GetAllChaptersCubit>().chapterNames,
                    "chapterIndx":
                        context.read<GetAllChaptersCubit>().chapterIndx,
                    "chapterId": -1,
                    "namech": "empty"
                  });
            } else {
              Navigator
                  .pushNamed(context, Routes.courseEditViewRoute, arguments: {
                "subjectId": widget.courseModel.subjectId,
                "chaptersN": context.read<GetAllChaptersCubit>().chapterNames,
                "chapterIndx": context.read<GetAllChaptersCubit>().chapterIndx,
                "chapterId": context.read<GetAllChaptersCubit>().chapterIndx[
                    context.read<GetAllChaptersCubit>().chapterNames[0]],
                "namech": context.read<GetAllChaptersCubit>().chapterNames[0],
              });
            }
          }),
    );
  }

  Row actionButton(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            text: 'الاختبارات',
            onpressed: () {
              Navigator.of(context).pushNamed(Routes.showAllQuizzesViewRoute,
                  arguments: widget.courseModel.subjectId);
            },
            backroundcolor: kBackgroundColor,
            textStyle: Styles.textStyle20
                .copyWith(color: kPrimaryColor, fontWeight: FontWeight.bold),
            rectangleBorder: RoundedRectangleBorder(
              side: const BorderSide(color: kPrimaryColor),
              borderRadius: BorderRadius.circular(6.r),
            ),
          ),
        ),
        SizedBox(width: 10.w),
        Expanded(
            child: CustomButton(
          text: 'الطلاب',
          onpressed: () {
            Navigator.pushNamed(context, Routes.enrolledStudentsViewRoute,
                arguments: widget.courseModel.subjectId);
          },
          backroundcolor: kBackgroundColor,
          textStyle: Styles.textStyle20
              .copyWith(color: kPrimaryColor, fontWeight: FontWeight.bold),
          rectangleBorder: RoundedRectangleBorder(
            side: const BorderSide(color: kPrimaryColor),
            borderRadius: BorderRadius.circular(6.r),
          ),
        )),
      ],
    );
  }

  BlocProvider<GetAllCoursesTeacherCubit> blocProviderUpdatePrice() {
    return BlocProvider(
      create: (context) =>
          GetAllCoursesTeacherCubit(getIt<CourseRepoImplement>()),
      child: BlocConsumer<GetAllCoursesTeacherCubit, GetAllCoursesTeacherState>(
        listener: (context, state) {
          if (state is AddCourseUpdateSuccess) {
            successCherryToast(context, "تم", "تم تعديل الدورة بنجاح");
            Navigator.pop(context);
            Navigator.pop(context);
          } else if (state is AddCourseUpdateFailure) {
            errorCherryToast(context, "خطأ", state.errMessage);
          }
        },
        builder: (context, state) {
          return state is AddCourseUpdateLoading
              ? const CustomLoadingWidget()
              : Container(
                  decoration: BoxDecoration(
                    //   border: Border.all(color: ),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                title: const Text("تعديل السعر"),
                                content: TextField(
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    labelText: "ادخل السعر الجديد",
                                  ),
                                  controller: controller,
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      if (controller.text.isEmpty) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                                "يجب عليك ادخال السعر الجديد "),
                                          ),
                                        );
                                      } else {
                                        context
                                            .read<GetAllCoursesTeacherCubit>()
                                            .updateCourse(
                                                courseModel: CourseModel(
                                              pricePerHour: widget
                                                  .courseModel.pricePerHour,
                                              id: widget.courseModel.id,
                                              tolalPrice:
                                                  int.parse(controller.text),
                                              studentCount: widget
                                                  .courseModel.studentCount,
                                              level: widget.courseModel.level,
                                              term: widget.courseModel.term,
                                              subjectName: widget
                                                  .courseModel.subjectName,
                                              subjectId:
                                                  widget.courseModel.subjectId,
                                              isActive:
                                                  widget.courseModel.isActive,
                                              isOnline:
                                                  widget.courseModel.isOnline,
                                              describtion: widget
                                                  .courseModel.describtion,
                                            ));
                                      }
                                    },
                                    child: const Text("اضافة"),
                                  ),
                                ],
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.edit,
                            color: kPrimaryColor,
                          ),
                        ),
                        Text(" ${widget.courseModel.tolalPrice} : سعر الكورس",
                            style: Styles.textStyle16),
                      ]),
                );
        },
      ),
    );
  }

  Container courseDetails() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      width: double.infinity,
      decoration: BoxDecoration(
        color: kSplashDarkerColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Text(
                  '${widget.courseModel.level!} / ${widget.courseModel.term == 1 ? 'الترم الأول' : 'الترم الثاني'}',
                  textAlign: TextAlign.center,
                  style: Styles.textStyle14.copyWith(color: kPrimaryColor),
                ),
              ),
              SizedBox(
                height: 80.h,
                child: VerticalDivider(
                  color: kPrimaryColor,
                  width: 30.w,
                  thickness: 1.5,
                  indent: 10,
                  endIndent: 10,
                ),
              ),
              Expanded(
                child: Text(
                  widget.courseModel.subjectName!,
                  textAlign: TextAlign.center,
                  style: Styles.textStyle18.copyWith(color: kPrimaryColor),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Column(
                  children: [
                    const Text("عدد الطلاب"),
                    SizedBox(height: 12.h),
                    Text(
                      widget.courseModel.studentCount.toString(),
                      style: Styles.textStyle18.copyWith(
                        color: kPrimaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 80.h,
                child: VerticalDivider(
                  color: kPrimaryColor,
                  width: 30.w,
                  thickness: 1.5,
                  indent: 10,
                  endIndent: 10,
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    const Text("سعر الحصة"),
                    SizedBox(height: 12.h),
                    Text(
                      "${widget.courseModel.pricePerHour} جنية",
                      style: Styles.textStyle16.copyWith(
                        color: kPrimaryColor,
                      ),
                      textDirection: TextDirection.rtl,
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  BlocBuilder<SwithSelectCubit, bool> blocBuilderSwitchIsActive() {
    return BlocBuilder<SwithSelectCubit, bool>(
      builder: (context, stateswitc) {
        return BlocProvider(
          create: (context) =>
              GetAllCoursesTeacherCubit(getIt<CourseRepoImplement>()),
          child: BlocConsumer<GetAllCoursesTeacherCubit,
              GetAllCoursesTeacherState>(
            listener: (context, state) {},
            builder: (context, state) {
              return state is AddCourseUpdateLoading
                  ? const CustomLoadingWidget()
                  : Switch(
                      value: context.read<SwithSelectCubit>().isactive,
                      focusColor: kPrimaryColor,
                      activeColor: kPrimaryColor,
                      onChanged: (value) {
                        context.read<SwithSelectCubit>().toggle();
                        context
                            .read<GetAllCoursesTeacherCubit>()
                            .updateCourse(courseModel: widget.courseModel);
                        BlocProvider.of<GetAllCoursesTeacherCubit>(context)
                            .getCourses(
                                teacherId: widget.courseModel.teacherId!);
                      },
                    );
            },
          ),
        );
      },
    );
  }

  SliverAppBar sliverAppBar(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      expandedHeight: 230.h,
      pinned: true,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const CustomPopIconButton(
            backgroundColor: Colors.white70,
          )),
      flexibleSpace: FlexibleSpaceBar(
          background: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/english.png"),
            fit: BoxFit.fill,
          ),
        ),
      )),
    );
  }
}

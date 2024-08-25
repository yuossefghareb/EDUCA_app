import 'package:field_training_app/Core/api_services/end_points.dart';
import 'package:field_training_app/Core/models/subject_model.dart';
import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/utils/routes.dart';
import 'package:field_training_app/Core/utils/styles.dart';
import 'package:field_training_app/Core/utils/subject_image.dart';
import 'package:field_training_app/Core/widgets/custom_button.dart';
import 'package:field_training_app/Core/widgets/custom_cached_image.dart';
import 'package:field_training_app/Core/widgets/custom_cherry_toast.dart';
import 'package:field_training_app/Core/widgets/custom_loading_widget.dart';
import 'package:field_training_app/Core/widgets/pop_icon_button.dart';
import 'package:field_training_app/cache/cache_helper.dart';
import 'package:field_training_app/student_features/enrollment/presentation/view_model/cubit/enrollment_cubit.dart';
import 'package:field_training_app/student_features/payment/presentation/view_model/payment_cubit/payment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseDetailsViewBody extends StatelessWidget {
  const CourseDetailsViewBody({
    super.key,
    required this.subjectModel,
  });
  final SubjectModel subjectModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Stack(
          children: [
            Container(
              height: 220.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(subjectImage(subjectModel.subjName!)),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              bottom: -30.h,
              child: Container(
                height: 55.h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.r),
                      topRight: Radius.circular(30.r),
                    )),
              ),
            ),
            const Positioned(
                top: 15,
                left: 15,
                child: CustomPopIconButton(backgroundColor: Colors.white70))
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    Routes.teacherDetailsViewRoute,
                    arguments: subjectModel.teacherId,
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      subjectModel.teacherName!,
                      style: Styles.textStyle16
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    SizedBox(width: 10.w),
                    CustomCachedImage(
                      imageUrl: subjectModel.profileImageUrl ?? '',
                      width: 40,
                      height: 40,
                      errorIconSize: 23,
                      loadingWidth: 20.w,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              subjectModel.addingTime != null
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(subjectModel.addingTime!.substring(0, 10),
                            style: Styles.textStyle14),
                        SizedBox(width: 10.w),
                        Text(
                          ' : تاريخ الأنشاء',
                          style: Styles.textStyle12
                              .copyWith(color: Colors.grey.shade700),
                        ),
                      ],
                    )
                  : const SizedBox.shrink(),
              subjectModel.addingTime != null
                  ? SizedBox(height: 22.h)
                  : const SizedBox.shrink(),
              Container(
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
                            '${subjectModel.level!} / ${subjectModel.term == 1 ? 'الترم الأول' : 'الترم الثاني'}',
                            textAlign: TextAlign.center,
                            style: Styles.textStyle14
                                .copyWith(color: kPrimaryColor),
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
                            subjectModel.subjName!,
                            textAlign: TextAlign.center,
                            style: Styles.textStyle18
                                .copyWith(color: kPrimaryColor),
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
                              const Text("عدد الاختبارات"),
                              SizedBox(height: 12.h),
                              Text(
                                '${subjectModel.quizCount}',
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
                                "${subjectModel.pricePerHour} جنية",
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
              ),
              SizedBox(height: 25.h),
              Text(
                "وصف المادة : ",
                style: Styles.textStyle12.copyWith(color: Colors.grey.shade700),
                textDirection: TextDirection.rtl,
              ),
              SizedBox(height: 7.h),
              Text(
                subjectModel.describtion == null ||
                        subjectModel.describtion == ''
                    ? 'لا يوجد وصف للمادة'
                    : subjectModel.describtion!,
                style: Styles.textStyle14,
                textDirection: TextDirection.rtl,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        Expanded(child: SizedBox(height: 10.h)),
        subjectModel.isOnilne == true
            ? const SizedBox.shrink()
            : Padding(
                padding: const EdgeInsets.all(20),
                child: BlocBuilder<EnrollmentCubit, EnrollmentState>(
                  builder: (context, state) {
                    if (state is AllStudentsEnrolledInSpecSubjectSuccess) {
                      bool enrolled = state.studentsList.any((element) =>
                          element.studentId ==
                          CacheHelper.getData(key: ApiKey.id));
                      return enrolled == false
                          ? BlocConsumer<PaymentCubit, PaymentState>(
                              listener: (context, paymentState) {
                                if (paymentState
                                    is PaymentOrderIdSuccessState) {
                                  Navigator.pushNamed(
                                      context, Routes.paymentOptionViewRoute,
                                      arguments: subjectModel.id!);
                                } else if (paymentState
                                    is PaymentOrderIdErrorState) {
                                  errorCherryToast(context, "حدث خطا",
                                      "يرجي المحاولة مرة اخري");
                                }
                              },
                              builder: (context, paymentState) {
                                return paymentState
                                        is PaymentOrderIdLoadingState
                                    ? const CustomLoadingWidget()
                                    : CustomButton(
                                        text:
                                            "شراء المادة (${subjectModel.totalPrice} جنية)",
                                        onpressed: () {
                                          context
                                              .read<PaymentCubit>()
                                              .getOrderRegistrationID(
                                                price: subjectModel
                                                    .pricePerHour!
                                                    .toString(),
                                                firstName: CacheHelper.getData(
                                                    key: studentFirstName),
                                                lastName: CacheHelper.getData(
                                                    key: studentLastName),
                                                email: CacheHelper.getData(
                                                    key: studentEmail),
                                                phone: CacheHelper.getData(
                                                    key: studentPhone),
                                              );
                                        });
                              },
                            )
                          : Row(
                              children: [
                                Expanded(
                                  child: CustomButton(
                                      text: 'الاختبارات',
                                      onpressed: () {
                                        Navigator.pushNamed(
                                          context,
                                          Routes.quizzesListViewRoute,
                                          arguments: subjectModel.id!,
                                        );
                                      }),
                                ),
                                SizedBox(width: 12.w),
                                Expanded(
                                  child: CustomButton(
                                      text: 'الدروس',
                                      onpressed: () {
                                        Navigator.pushNamed(context,
                                            Routes.lessonsListViewRoute,
                                            arguments: subjectModel.id!);
                                      }),
                                ),
                              ],
                            );
                    } else if (state
                        is AllStudentsEnrolledInSpecSubjectFailure) {
                      return BlocConsumer<PaymentCubit, PaymentState>(
                        listener: (context, paymentState) {
                          if (paymentState is PaymentOrderIdSuccessState) {
                            Navigator.pushNamed(
                                context, Routes.paymentOptionViewRoute,
                                arguments: subjectModel.id!);
                          } else if (paymentState is PaymentOrderIdErrorState) {
                            errorCherryToast(
                                context, "حدث خطا", "يرجي المحاولة مرة اخري");
                          }
                        },
                        builder: (context, paymentState) {
                          return paymentState is PaymentOrderIdLoadingState
                              ? const CustomLoadingWidget()
                              : CustomButton(
                                  text:
                                      "شراء المادة (${subjectModel.totalPrice} جنية)",
                                  onpressed: () {
                                    context
                                        .read<PaymentCubit>()
                                        .getOrderRegistrationID(
                                          price: subjectModel.pricePerHour!
                                              .toString(),
                                          firstName: CacheHelper.getData(
                                              key: studentFirstName),
                                          lastName: CacheHelper.getData(
                                              key: studentLastName),
                                          email: CacheHelper.getData(
                                              key: studentEmail),
                                          phone: CacheHelper.getData(
                                              key: studentPhone),
                                        );
                                  });
                        },
                      );
                    }
                    return const CustomLoadingWidget();
                  },
                ),
              ),
      ],
    );
  }
}

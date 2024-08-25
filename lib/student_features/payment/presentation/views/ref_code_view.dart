import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/utils/payment_constants.dart';
import 'package:field_training_app/Core/utils/styles.dart';
import 'package:field_training_app/Core/widgets/custom_loading_widget.dart';
import 'package:field_training_app/Core/widgets/pop_icon_button.dart';
import 'package:field_training_app/student_features/payment/presentation/view_model/payment_cubit/payment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/widgets/custom_failure_widget.dart';

class RefCodeView extends StatelessWidget {
  const RefCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15.h),
              const CustomPopIconButton(),
              const Expanded(child: SizedBox()),
              BlocBuilder<PaymentCubit, PaymentState>(
                builder: (context, state) {
                  if (state is PaymentRefCodeSuccessState) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'يجب عليك الذهاب لاي متجر للدفع',
                          style: Styles.textStyle20
                              .copyWith(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          'الرمز المرجعي الخاص بك',
                          style: Styles.textStyle18,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 30.0.h),
                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.only(top: 16, bottom: 4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: kPrimaryColor,
                          ),
                          child: Text(
                            PaymentConstants.paymentRefCode,
                            style: const TextStyle(
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    );
                  } else if (state is PaymentRefCodeErrorState) {
                    return const CustomFailureWidget(
                        errMessage: "حدثت مشكلة , حاول في وقت لاحق");
                  }
                  return const CustomLoadingWidget();
                },
              ),
              const Expanded(child: SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}

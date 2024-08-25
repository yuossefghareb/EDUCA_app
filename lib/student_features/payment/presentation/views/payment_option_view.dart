import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/utils/styles.dart';
import 'package:field_training_app/Core/widgets/pop_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/payment_option_view_body.dart';

class PaymentOptionView extends StatelessWidget {
  const PaymentOptionView({super.key, required this.subjectID});
  final int subjectID;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: CustomPopIconButton(
          backgroundColor: Colors.white70,
          radius: 18.r,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text("أختر طريقة الدفع",
                style: Styles.textStyle18.copyWith(color: Colors.white)),
          ),
          SizedBox(width: 14.w),
        ],
        elevation: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: 60,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(child: PaymentOptionViewBody(subjectID: subjectID)),
    );
  }
}

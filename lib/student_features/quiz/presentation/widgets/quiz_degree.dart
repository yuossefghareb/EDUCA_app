import 'package:field_training_app/Core/utils/constatnt.dart';
import 'package:field_training_app/Core/utils/styles.dart';
import 'package:flutter/material.dart';

class QuizDegree extends StatelessWidget {
  const QuizDegree({super.key, required this.left, required this.right});
  final int left;
  final int right;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
      width: 125,
      padding: const EdgeInsets.only(top: 8),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: kPrimaryColor, width: 1.2),
        borderRadius: BorderRadius.circular(150),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            left.toString(),
            style: Styles.textStyle24.copyWith(color: kPrimaryColor),
          ),
          Text(" / $right", style: Styles.textStyle16),
        ],
      ),
    );
  }
}

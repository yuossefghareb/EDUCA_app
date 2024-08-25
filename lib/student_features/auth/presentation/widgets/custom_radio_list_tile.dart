import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:field_training_app/Core/utils/constatnt.dart';

import '../../../../Core/utils/styles.dart';
import '../view_model/register_option_cubit.dart';

class CustomRadioListTile extends StatelessWidget {
  const CustomRadioListTile(
      {super.key, required this.optionState, required this.value});

  final String optionState;
  final String value;

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      contentPadding: EdgeInsets.zero,
      value: value,
      visualDensity: VisualDensity.compact,
      activeColor: kPrimaryColor,
      controlAffinity: ListTileControlAffinity.trailing,
      selected: optionState == value ? true : false,
      title: Text(value, style: Styles.textStyle16, textAlign: TextAlign.right),
      groupValue: optionState,
      onChanged: (value) {
        context.read<OptionCubit>().changeRegisterOption(value!);
      },
    );
  }
}

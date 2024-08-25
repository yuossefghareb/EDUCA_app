import 'package:flutter_bloc/flutter_bloc.dart';

class OptionCubit extends Cubit<String> {
  OptionCubit() : super("");

  void changeRegisterOption(String option) {
    emit(option);
  }
}

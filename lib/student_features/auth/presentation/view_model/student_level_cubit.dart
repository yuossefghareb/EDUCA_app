import 'package:flutter_bloc/flutter_bloc.dart';

class StudentLevelCubit extends Cubit<String> {
  StudentLevelCubit() : super("أختر الصف الدراسي");

  void changeState(String val) {
    emit(val);
  }
}

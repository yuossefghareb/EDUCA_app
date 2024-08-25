import 'package:flutter_bloc/flutter_bloc.dart';

class DropDownListCubit extends Cubit<String> {
  DropDownListCubit() : super("اختر");
  String lev = " الصف الاول الدراسي";
  String sub = "اللغة العربية";
  String price = "اختر السعر";
  String term = "اختر الترم";

  void changeIndexDropDownListLevel(String ch) {
    lev = ch;
    emit(ch);
  }

  void changeIndexDropDownListsubject(String ch) {
    sub = ch;
    emit(ch);
  }

  void changeIndexDropDownListprice(String ch) {
    price = ch;
    emit(ch);
  }

  void changeIndexDropDownListterm(String ch) {
    term = ch;
    emit(ch);
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';

class GovernorateSelectCubit extends Cubit<String> {
  GovernorateSelectCubit() : super("أختر المحافظة");

  void changeState(String val) {
    emit(val);
  }
}

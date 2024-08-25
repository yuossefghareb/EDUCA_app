import 'package:flutter_bloc/flutter_bloc.dart';

class BottomBarCubit extends Cubit<int> {
  BottomBarCubit() : super(3);

  void changeBottomBarIndex(int index) {
    emit(index);
  }
}

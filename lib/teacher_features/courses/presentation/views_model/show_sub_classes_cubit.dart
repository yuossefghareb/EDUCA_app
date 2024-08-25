import 'package:flutter_bloc/flutter_bloc.dart';

class ShowSubClassesCubit extends Cubit<Map<int, bool>> {
  ShowSubClassesCubit() : super({});

  void toggleExpansion(int index) {
    final currentState = Map<int, bool>.from(state);
    currentState[index] = !(currentState[index] ?? false);
    emit(currentState);
  }
}

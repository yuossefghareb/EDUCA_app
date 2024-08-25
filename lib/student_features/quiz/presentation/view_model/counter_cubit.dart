import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<double> {
  CounterCubit() : super(0);

  void increment(double page) => emit(page);
  void decrement(double page) => emit(page);
}

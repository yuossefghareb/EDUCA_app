part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeGetSubjectsLoading extends HomeState {}

final class HomeGetSubjectsSuccess extends HomeState {
  final List<SubjectModel> subjectList;

  const HomeGetSubjectsSuccess({required this.subjectList});
}

final class HomeGetSubjectsFailure extends HomeState {
  final String errMessage;

  const HomeGetSubjectsFailure({required this.errMessage});
}

part of 'add_course_cubit.dart';

sealed class AddCourseState extends Equatable {
  const AddCourseState();

  @override
  List<Object> get props => [];
}

final class AddCourseInitial extends AddCourseState {}

final class AddCourseLoading extends AddCourseState {}

final class AddCourseSuccess extends AddCourseState {}

final class AddCourseFailure extends AddCourseState {
  final String errMessage;

  const AddCourseFailure({required this.errMessage});
}

part of 'get_all_courses_teacher_cubit.dart';

sealed class GetAllCoursesTeacherState extends Equatable {
  const GetAllCoursesTeacherState();

  @override
  List<Object> get props => [];
}

final class GetAllCoursesTeacherInitial extends GetAllCoursesTeacherState {}

final class GetAllCoursesTeacherLoading extends GetAllCoursesTeacherState {}

final class GetAllCoursesTeacherSuccess extends GetAllCoursesTeacherState {
  final List<CourseModel> courses;

  const GetAllCoursesTeacherSuccess(this.courses);
}

final class GetAllCoursesTeacherFailure extends GetAllCoursesTeacherState {
  final String message; // error message

  const GetAllCoursesTeacherFailure(this.message);
}

final class GetAllCoursesDeleteSubjectSuccess
    extends GetAllCoursesTeacherState {}

final class GetAllCoursesDeleteSubjectLoading
    extends GetAllCoursesTeacherState {}

final class GetAllCoursesDeleteSubjectFailure
    extends GetAllCoursesTeacherState {
  final String message; // error message

  const GetAllCoursesDeleteSubjectFailure(this.message);
}

final class AddCourseUpdateSuccess extends GetAllCoursesTeacherState {}

final class AddCourseUpdateLoading extends GetAllCoursesTeacherState {}

final class AddCourseUpdateFailure extends GetAllCoursesTeacherState {
  final String errMessage;

  const AddCourseUpdateFailure({required this.errMessage});
}

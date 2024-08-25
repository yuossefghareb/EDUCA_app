part of 'teacher_profile_cubit.dart';

sealed class TeacherProfileState extends Equatable {
  const TeacherProfileState();

  @override
  List<Object> get props => [];
}

final class TeacherProfileInitial extends TeacherProfileState {}

final class TeacherProfileLoading extends TeacherProfileState {}

final class TeacherProfileSuccess extends TeacherProfileState {
  final TeacherModel teacherModel;
  const TeacherProfileSuccess({required this.teacherModel});
}

final class TeacherProfileFailure extends TeacherProfileState {
  final String errMessage;
  const TeacherProfileFailure({required this.errMessage});
}

final class TeacherProfileUpdateLoading extends TeacherProfileState {}

final class TeacherProfileUpdateSuccess extends TeacherProfileState {}

final class TeacherProfileUpdateFailure extends TeacherProfileState {
  final String errMessage;
  const TeacherProfileUpdateFailure({required this.errMessage});
}

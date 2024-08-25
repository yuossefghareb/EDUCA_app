part of 'student_profile_cubit.dart';

sealed class StudentProfileState extends Equatable {
  const StudentProfileState();

  @override
  List<Object> get props => [];
}

final class StudentProfileInitial extends StudentProfileState {}

final class StudentProfileLoading extends StudentProfileState {}

final class StudentProfileSuccess extends StudentProfileState {
  final StudentModel studentModel;
  const StudentProfileSuccess({required this.studentModel});
}

final class StudentProfileFailure extends StudentProfileState {
  final String errMessage;
  const StudentProfileFailure({required this.errMessage});
}

final class StudentProfileUpdateLoading extends StudentProfileState {}

final class StudentProfileUpdateSuccess extends StudentProfileState {}

final class StudentProfileUpdateFailure extends StudentProfileState {
  final String errMessage;
  const StudentProfileUpdateFailure({required this.errMessage});
}

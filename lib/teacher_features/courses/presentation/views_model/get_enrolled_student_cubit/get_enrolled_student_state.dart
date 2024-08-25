part of 'get_enrolled_student_cubit.dart';

sealed class GetEnrolledStudentState extends Equatable {
  const GetEnrolledStudentState();

  @override
  List<Object> get props => [];
}

final class GetEnrolledStudentInitial extends GetEnrolledStudentState {}

final class GetEnrolledStudentLoading extends GetEnrolledStudentState {}

final class GetEnrolledStudentSuccess extends GetEnrolledStudentState {
  final List<AllStudentsEnrolledInSpecSubjectModel> enrolledStudentList;
  const GetEnrolledStudentSuccess(this.enrolledStudentList);
}

final class GetEnrolledStudentFailure extends GetEnrolledStudentState {
  final String message;
  const GetEnrolledStudentFailure(this.message);
}

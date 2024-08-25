part of 'enrollment_cubit.dart';

sealed class EnrollmentState extends Equatable {
  const EnrollmentState();

  @override
  List<Object> get props => [];
}

final class EnrollmentInitial extends EnrollmentState {}

final class EnrollmentLoading extends EnrollmentState {}

final class EnrollmentSuccess extends EnrollmentState {}

final class EnrollmentFailure extends EnrollmentState {
  final String errMessage;
  const EnrollmentFailure({required this.errMessage});
}

//! for all student enrolled subjects
final class EnrolledSubjectsLoading extends EnrollmentState {}

final class EnrolledSubjectsSuccess extends EnrollmentState {
  final List<SubjectModel> enrolledSubjects;
  const EnrolledSubjectsSuccess({required this.enrolledSubjects});
}

final class EnrolledSubjectsFailure extends EnrollmentState {
  final String errMessage;
  const EnrolledSubjectsFailure({required this.errMessage});
}

//! for get subject by ID
final class GetSubjectLoading extends EnrollmentState {}

final class GetSubjectSuccess extends EnrollmentState {
  final SubjectModel subjectModel;
  const GetSubjectSuccess({required this.subjectModel});
}

final class GetSubjectFailure extends EnrollmentState {
  final String errMessage;
  const GetSubjectFailure({required this.errMessage});
}

//! allStudents Enrolled In Spec Subject
final class AllStudentsEnrolledInSpecSubjectLoading extends EnrollmentState {}

final class AllStudentsEnrolledInSpecSubjectSuccess extends EnrollmentState {
  final List<AllStudentsEnrolledInSpecSubjectModel> studentsList;
  const AllStudentsEnrolledInSpecSubjectSuccess({required this.studentsList});
}

final class AllStudentsEnrolledInSpecSubjectFailure extends EnrollmentState {
  final String errMessage;
  const AllStudentsEnrolledInSpecSubjectFailure({required this.errMessage});
}

part of 'teacher_details_cubit.dart';

sealed class TeacherDetailsState extends Equatable {
  const TeacherDetailsState();

  @override
  List<Object> get props => [];
}

final class TeacherDetailsInitial extends TeacherDetailsState {}

final class TeacherDetailsLoading extends TeacherDetailsState {}

final class TeacherDetailsSuccess extends TeacherDetailsState {
  final TeacherModel teacherModel;
  const TeacherDetailsSuccess({required this.teacherModel});
}

final class TeacherDetailsFailure extends TeacherDetailsState {
  final String errMessage;
  const TeacherDetailsFailure({required this.errMessage});
}

final class TeacherSubjectsLoading extends TeacherDetailsState {}

final class TeacherSubjectsSuccess extends TeacherDetailsState {
  final List<SubjectModel> subjectList;
  const TeacherSubjectsSuccess({required this.subjectList});
}

final class TeacherSubjectsFailure extends TeacherDetailsState {
  final String errMessage;
  const TeacherSubjectsFailure({required this.errMessage});
}

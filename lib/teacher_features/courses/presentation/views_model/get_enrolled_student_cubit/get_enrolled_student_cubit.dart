import 'package:equatable/equatable.dart';
import 'package:field_training_app/student_features/enrollment/data/models/all_students_enrolled_in_spec_subject_model/all_students_enrolled_in_spec_subject_model.dart';
import 'package:field_training_app/student_features/enrollment/data/repo/enrollment_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_enrolled_student_state.dart';

class GetEnrolledStudentCubit extends Cubit<GetEnrolledStudentState> {
  GetEnrolledStudentCubit(this.enrollmentRepo)
      : super(GetEnrolledStudentInitial());
  final EnrollmentRepo enrollmentRepo;
  void getEnrolledStudent({required int subjectID}) async {
    emit(GetEnrolledStudentLoading());
    var result = await enrollmentRepo.allStudentsEnrolledInSpecSubject(
        subjectID: subjectID);
    result.fold((failure) {
      emit(const GetEnrolledStudentFailure(
          "the Subject Doesn't have Any Enrollment"));
    }, (enrolledStudentList) {
      emit(GetEnrolledStudentSuccess(enrolledStudentList));
    });
  }
}

import 'package:equatable/equatable.dart';
import 'package:field_training_app/Core/models/subject_model.dart';
import 'package:field_training_app/student_features/enrollment/data/models/all_students_enrolled_in_spec_subject_model/all_students_enrolled_in_spec_subject_model.dart';
import 'package:field_training_app/student_features/enrollment/data/repo/enrollment_repo_implement.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'enrollment_state.dart';

class EnrollmentCubit extends Cubit<EnrollmentState> {
  EnrollmentCubit(this.enrollmentRepoImplement) : super(EnrollmentInitial());
  final EnrollmentRepoImplement enrollmentRepoImplement;

  Future<void> studentEnrollment(int studentID, int subjectID) async {
    emit(EnrollmentLoading());
    final result = await enrollmentRepoImplement.studentEnrollment(
        studentID: studentID, subjectID: subjectID);
    result.fold((failure) {
      emit(EnrollmentFailure(errMessage: failure.errMessage));
    }, (successMessage) {
      emit(EnrollmentSuccess());
    });
  }

  Future<void> allStudentEnrolledSubjects(int studentID) async {
    emit(EnrolledSubjectsLoading());
    final result = await enrollmentRepoImplement.allStudentEnrolledSubjects(
        studentID: studentID);
    result.fold((failure) {
      emit(EnrolledSubjectsFailure(errMessage: failure.errMessage));
    }, (enrolledSubjects) async {
      List<SubjectModel> studentSubjects = [];
      for (var element in enrolledSubjects) {
        if (element.isActive == true) {
          SubjectModel subjectModel = await getSubjectByID(element.subjectId!);
          studentSubjects.add(subjectModel);
        }
      }
      emit(EnrolledSubjectsSuccess(enrolledSubjects: studentSubjects));
    });
  }

  Future<SubjectModel> getSubjectByID(int subjectID) async {
    emit(GetSubjectLoading());
    SubjectModel temp = const SubjectModel();
    final result =
        await enrollmentRepoImplement.getSubjectByID(subjectID: subjectID);
    result.fold((failure) {
      emit(GetSubjectFailure(errMessage: failure.errMessage));
    }, (subjectModel) {
      temp = subjectModel;
      emit(GetSubjectSuccess(subjectModel: subjectModel));
      return subjectModel;
    });
    return temp;
  }

  Future<void> allStudentsEnrolledInSpecSubject(int subjectID) async {
    emit(AllStudentsEnrolledInSpecSubjectLoading());
    final result = await enrollmentRepoImplement
        .allStudentsEnrolledInSpecSubject(subjectID: subjectID);
    result.fold((failure) {
      emit(AllStudentsEnrolledInSpecSubjectFailure(
          errMessage: failure.errMessage));
    }, (studentsList) {
      emit(AllStudentsEnrolledInSpecSubjectSuccess(studentsList: studentsList));
    });
  }
}

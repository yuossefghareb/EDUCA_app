import 'package:equatable/equatable.dart';
import 'package:field_training_app/Core/models/quiz_model.dart';
import 'package:field_training_app/teacher_features/make_quiz/data/repos/add_quiz_repo/add_quzi_repo_impelement.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_quiz_state.dart';

class AddQuizCubit extends Cubit<AddQuizState> {
  AddQuizCubit(this.addQuizRepoImplement) : super(AddQuizInitial());

  final AddQuizRepoImplement addQuizRepoImplement;

  Future<void> addQuiz({required String title, required int subjectId}) async {
    emit(AddQuizLoading());
    var result = await addQuizRepoImplement.addQuiz(
      description: title,
      subjectId: subjectId,
    );
    result.fold((failure) {
      emit(AddQuizFailure(errMessage: failure.errMessage));
    }, (quizmodel) {
      emit(AddQuizSuccess(quizModel: quizmodel));
    });
  }

  Future<void> getAllQuiz({required int subjectId}) async {
    emit(GetAllQuizLoading());
    var result = await addQuizRepoImplement.getAllQuizzes(
      subjectId: subjectId,
    );
    result.fold((failure) {
      emit(GetAllQuizFailure(errMessage: failure.errMessage));
    }, (quizModelList) {
      emit(GetAllQuizSuccess(quizModelList: quizModelList));
    });
  }

  Future<void> deleteQuiz({required int quizId}) async {
    emit(DeleteQuizLoading());
    var result = await addQuizRepoImplement.deleteQuiz(quizId: quizId);
    result.fold((failure) {
      emit(DeleteQuizFailure(message: failure.errMessage));
    }, (message) {
      emit(DeleteQuizSuccess());
    });
  }
}

import 'package:equatable/equatable.dart';
import 'package:field_training_app/Core/models/question_model.dart';
import 'package:field_training_app/Core/models/quiz_model.dart';
import 'package:field_training_app/student_features/quiz/data/repo/quiz_repo_implement.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit(this.quizRepoImplement) : super(QuizInitial());
  final QuizRepoImplement quizRepoImplement;

  Future<void> getAllQuizzesAssociatedWithSubjectID(int subjectID) async {
    emit(QuizLoading());
    var result = await quizRepoImplement.getAllQuizzesAssociatedWithSubject(
      subjectID: subjectID,
    );
    result.fold(
      (failure) {
        emit(QuizFaliure(errMessage: failure.errMessage));
      },
      (quizzes) {
        emit(QuizSuccess(quizzes: quizzes));
      },
    );
  }

  Future<void> getAllQuestionsAssociatedWithQuiz(int quizID) async {
    emit(QuestionLoading());
    var result = await quizRepoImplement.getAllQuestionsAssociatedWithQuiz(
      quizID: quizID,
    );
    result.fold(
      (failure) {
        emit(QuestionFaliure(errMessage: failure.errMessage));
      },
      (questions) {
        emit(QuestionSuccess(questionList: questions));
      },
    );
  }
}

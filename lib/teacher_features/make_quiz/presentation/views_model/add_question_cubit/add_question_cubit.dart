import 'package:equatable/equatable.dart';
import 'package:field_training_app/Core/models/question_model.dart';
import 'package:field_training_app/teacher_features/make_quiz/data/repos/add_quiz_repo/add_quiz_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_question_state.dart';

class AddQuestionCubit extends Cubit<AddQuestionState> {
  AddQuestionCubit(this.addQuizRepo) : super(AddQuestionInitial());

  final AddQuizRepo addQuizRepo;

  Future<void> addQuestion({
    required int quizId,
    required String content,
    required String option1,
    required String option2,
    required String option3,
    required String option4,
    required String correctAnswer,
  }) async {
    emit(AddQuestionLoading());
    var result = await addQuizRepo.addQuestion(
      content: content,
      option1: option1,
      option2: option2,
      option3: option3,
      option4: option4,
      correctAnswer: correctAnswer,
      quizId: quizId,
    );
    result.fold((failure) {
      emit(AddQuestionFailure(errMessage: failure.errMessage));
    }, (questionmodel) {
      emit(AddQuestionSuccess(questionModel: questionmodel));
    });
  }

  Future<void>deleteQuestion({required int questionId}) async {
    emit(DeleteQuestionLoading());
    var result = await addQuizRepo.deleteQuestion(questionId: questionId);
    result.fold((failure) {
      emit(DeleteQuestionFailure(message: failure.errMessage));
    }, (message) {
      emit(DeleteQuestionSuccess());
    });
  }
}

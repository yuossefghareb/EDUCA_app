import 'package:equatable/equatable.dart';
import 'package:field_training_app/Core/models/question_model.dart';
import 'package:field_training_app/teacher_features/make_quiz/data/repos/add_quiz_repo/add_quiz_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_all_question_state.dart';

class GetAllQuestionCubit extends Cubit<GetAllQuestionState> {
  GetAllQuestionCubit(this.addQuizRepo) : super(GetAllQuestionInitial());

  final AddQuizRepo addQuizRepo;

  Future<void> getAllQuestion({required int quizId}) async {
    emit(GetAllQuestionLoading());
    var result = await addQuizRepo.getAllQuestions(quizId: quizId);
    result.fold((failure) {
      emit(GetAllQuestionFailure(errMessage: failure.errMessage));
    }, (questionModelList) {
      emit(GetAllQuestionSuccess(questionModelList: questionModelList));
    });
  }
}

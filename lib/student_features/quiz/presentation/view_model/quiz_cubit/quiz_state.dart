part of 'quiz_cubit.dart';

sealed class QuizState extends Equatable {
  const QuizState();

  @override
  List<Object> get props => [];
}

//! for quiz
final class QuizInitial extends QuizState {}

final class QuizLoading extends QuizState {}

final class QuizSuccess extends QuizState {
  final List<QuizModel> quizzes;

  const QuizSuccess({required this.quizzes});
}

final class QuizFaliure extends QuizState {
  final String errMessage;
  const QuizFaliure({required this.errMessage});
}

//! for question
final class QuestionLoading extends QuizState {}

final class QuestionSuccess extends QuizState {
  final List<QuestionModel> questionList;

  const QuestionSuccess({required this.questionList});
}

final class QuestionFaliure extends QuizState {
  final String errMessage;
  const QuestionFaliure({required this.errMessage});
}

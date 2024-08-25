part of 'get_all_question_cubit.dart';

sealed class GetAllQuestionState extends Equatable {
  const GetAllQuestionState();

  @override
  List<Object> get props => [];
}

final class GetAllQuestionInitial extends GetAllQuestionState {}

final class GetAllQuestionLoading extends GetAllQuestionState {}

final class GetAllQuestionSuccess extends GetAllQuestionState {
  final List<QuestionModel> questionModelList;
  const GetAllQuestionSuccess({required this.questionModelList});
}

final class GetAllQuestionFailure extends GetAllQuestionState {
  final String errMessage;
  const GetAllQuestionFailure({required this.errMessage});
}

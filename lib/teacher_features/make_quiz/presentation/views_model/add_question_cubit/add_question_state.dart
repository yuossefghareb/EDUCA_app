part of 'add_question_cubit.dart';

sealed class AddQuestionState extends Equatable {
  const AddQuestionState();

  @override
  List<Object> get props => [];
}

final class AddQuestionInitial extends AddQuestionState {}

final class AddQuestionLoading extends AddQuestionState {}

final class AddQuestionSuccess extends AddQuestionState {
  final QuestionModel questionModel;
  const AddQuestionSuccess({required this.questionModel});
}

final class AddQuestionFailure extends AddQuestionState {
  final String errMessage;
  const AddQuestionFailure({required this.errMessage});
}


final class DeleteQuestionLoading extends  AddQuestionState{}

final class DeleteQuestionSuccess extends AddQuestionState {
  
}

final class DeleteQuestionFailure extends AddQuestionState {  

  final String message;

  const DeleteQuestionFailure({required this.message});
}

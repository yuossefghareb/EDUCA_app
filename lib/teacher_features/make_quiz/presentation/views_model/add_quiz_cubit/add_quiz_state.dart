part of 'add_quiz_cubit.dart';

sealed class AddQuizState extends Equatable {
  const AddQuizState();

  @override
  List<Object> get props => [];
}

final class AddQuizInitial extends AddQuizState {}

final class AddQuizLoading extends AddQuizState {}

final class AddQuizSuccess extends AddQuizState {
  final QuizModel quizModel;
  const AddQuizSuccess({required this.quizModel});
}

final class AddQuizFailure extends AddQuizState {
  final String errMessage;
  const AddQuizFailure({required this.errMessage});
}

final class GetAllQuizLoading extends AddQuizState {}

final class GetAllQuizSuccess extends AddQuizState {
  final List<QuizModel> quizModelList;
  const GetAllQuizSuccess({required this.quizModelList});
}

final class GetAllQuizFailure extends AddQuizState {
  final String errMessage;
  const GetAllQuizFailure({required this.errMessage});
}



final class DeleteQuizLoading extends  AddQuizState{}

final class DeleteQuizSuccess extends AddQuizState {
  
}

final class DeleteQuizFailure extends AddQuizState {

  final String message;

  const DeleteQuizFailure({required this.message});
}
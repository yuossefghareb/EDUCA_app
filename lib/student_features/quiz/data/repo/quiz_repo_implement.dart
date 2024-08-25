import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:field_training_app/Core/api_services/api_service.dart';
import 'package:field_training_app/Core/api_services/end_points.dart';
import 'package:field_training_app/Core/api_services/failure.dart';
import 'package:field_training_app/Core/models/question_model.dart';
import 'package:field_training_app/Core/models/quiz_model.dart';
import 'package:field_training_app/student_features/quiz/data/repo/quiz_repo.dart';

class QuizRepoImplement implements QuizRepo {
  final ApiServices apiServices;

  QuizRepoImplement({required this.apiServices});
  @override
  Future<Either<Failure, List<QuizModel>>> getAllQuizzesAssociatedWithSubject(
      {required int subjectID}) async {
    try {
      var data = await apiServices.get(
        endPoint: EndPoint.getAllQuizzesAssociatedWithSubjectID(subjectID),
      );
      List<QuizModel> quizzes = [];
      for (var element in data) {
        quizzes.add(QuizModel.fromJson(element));
      }
      return right(quizzes);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(
        ServerFailure(e.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, List<QuestionModel>>>
      getAllQuestionsAssociatedWithQuiz({required int quizID}) async {
    try {
      var data = await apiServices.get(
        endPoint: EndPoint.getAllQuestionsAssociatedWithQuizID(quizID),
      );
      List<QuestionModel> questionList = [];
      for (var element in data) {
        questionList.add(QuestionModel.fromJson(element));
      }
      return right(questionList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(
        ServerFailure(e.toString()),
      );
    }
  }
}

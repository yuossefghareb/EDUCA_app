import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:field_training_app/Core/api_services/api_service.dart';
import 'package:field_training_app/Core/api_services/end_points.dart';
import 'package:field_training_app/Core/api_services/failure.dart';
import 'package:field_training_app/Core/models/quiz_model.dart';
import 'package:field_training_app/Core/models/question_model.dart';

import 'package:field_training_app/teacher_features/make_quiz/data/repos/add_quiz_repo/add_quiz_repo.dart';

class AddQuizRepoImplement implements AddQuizRepo {
  final ApiServices apiServices;

  AddQuizRepoImplement({required this.apiServices});
  @override
  Future<Either<Failure, QuizModel>> addQuiz(
      {required String description, required int subjectId}) async {
    try {
      var data = await apiServices.post(
        endPoint: EndPoint.quiz,
        data: {ApiKey.subjectId: subjectId, ApiKey.description: description},
      );

      QuizModel quizModel = QuizModel.fromJson(data);

      return right(quizModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure("حدث خطأ ما"));
    }
  }

  @override
  Future<Either<Failure, QuestionModel>> addQuestion(
      {required String content,
      required int quizId,
      required String option1,
      required String option2,
      required String option3,
      required String option4,
      required String correctAnswer}) async {
    try {
      var data = await apiServices.post(
        endPoint: EndPoint.questions,
        data: {
          ApiKey.content: content,
          ApiKey.quizId: quizId,
          ApiKey.option1: option1,
          ApiKey.option2: option2,
          ApiKey.option3: option3,
          ApiKey.option4: option4,
          ApiKey.correctAnswer: correctAnswer
        },
      );

      QuestionModel questionModel = QuestionModel.fromJson(data);

      return right(questionModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure("حدث خطأ ما"));
    }
  }

  @override
  Future<Either<Failure, List<QuizModel>>> getAllQuizzes(
      {required int subjectId}) async {
    try {
      var data = await apiServices.get(
        endPoint: EndPoint.getAllGuizsBySubjectId(subjectId),
      );

      List<QuizModel> quizModelList = [];

      for (var item in data) {
        quizModelList.add(QuizModel.fromJson(item));
      }

      return right(quizModelList);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<QuestionModel>>> getAllQuestions(
      {required int quizId}) async {
    try {
      var data = await apiServices.get(
        endPoint: EndPoint.getAllQuestionsByQuizId(quizId),
      );

      List<QuestionModel> questionModelList = [];

      for (var item in data) {
        questionModelList.add(QuestionModel.fromJson(item));
      }

      return right(questionModelList);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> deleteQuiz({required int quizId}) async {
    try {
      await apiServices.delete(EndPoint.deleteQuiz(quizId));
      return right('success deleted');
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    }
  }

  @override
  Future<Either<Failure, String>> deleteQuestion({required int questionId})async {
    
    try {
      await apiServices.delete(EndPoint.deleteQuestion(questionId));
      return right('success deleted');
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    }
  }
}

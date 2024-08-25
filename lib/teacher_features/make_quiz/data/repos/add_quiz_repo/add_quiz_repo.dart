import 'package:dartz/dartz.dart';
import 'package:field_training_app/Core/api_services/failure.dart';
import 'package:field_training_app/Core/models/quiz_model.dart';
import 'package:field_training_app/Core/models/question_model.dart';

abstract class AddQuizRepo {
  Future<Either<Failure, QuizModel>> addQuiz({
    required String description,
    required int subjectId,
  });
  Future<Either<Failure, QuestionModel>> addQuestion({
    required String content,
    required int quizId,
    required String option1,
    required String option2,
    required String option3,
    required String option4,
    required String correctAnswer,
  });

  Future<Either<Failure, List<QuizModel>>> getAllQuizzes({
    required int subjectId,
  });

  Future<Either<Failure, List<QuestionModel>>> getAllQuestions({
    required int quizId,
  });

  Future<Either<Failure, String>> deleteQuiz({
    required int quizId,
  });

  Future<Either<Failure, String>> deleteQuestion({
    required int questionId,
  });
}

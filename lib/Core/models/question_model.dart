// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:field_training_app/Core/api_services/end_points.dart';

class QuestionModel {
  String question;
  int quizId;
  int id;
  String option1;
  String option2;
  String option3;
  String option4;
  String correctAnswer;
  QuestionModel({
    required this.question,
    required this.id,
    required this.quizId,
    required this.option1,
    required this.option2,
    required this.option3,
    required this.option4,
    required this.correctAnswer,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      question: json[ApiKey.content] as String,
      id: json[ApiKey.id] as int,
      option1: json[ApiKey.option1] as String,
      option2: json[ApiKey.option2] as String,
      option3: json[ApiKey.option3] as String,
      quizId: json[ApiKey.quizId] as int,
      option4: json[ApiKey.option4] as String,
      correctAnswer: json[ApiKey.correctAnswer] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKey.content: question,
      ApiKey.option1: option1,
      ApiKey.option2: option2,
      ApiKey.option3: option3,
      ApiKey.id: id,
      ApiKey.quizId: quizId,
      ApiKey.option4: option4,
      ApiKey.correctAnswer: correctAnswer,
    };
  }

  List<Object?> get props => [
        question,
        option1,
        option2,
        id,
        option3,
        quizId,
        option4,
        correctAnswer,
      ];
}

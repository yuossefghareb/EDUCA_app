import 'package:equatable/equatable.dart';

class QuizModel extends Equatable {
  final int? id;
  final int? subjectId;
  final String? description;
  final String? createdDate;

  const QuizModel({
    this.id,
    this.subjectId,
    this.description,
    this.createdDate,
  });

  factory QuizModel.fromJson(Map<String, dynamic> json) => QuizModel(
        id: json['id'] as int?,
        subjectId: json['subjectId'] as int?,
        description: json['description'] as String?,
        createdDate: json['createdDate'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'subjectId': subjectId,
        'description': description,
        'createdDate': createdDate,
      };

  @override
  List<Object?> get props => [id, subjectId, description, createdDate];
}

import 'package:equatable/equatable.dart';

class LessonsModel extends Equatable {
  final int? id;
  final String? name;
  final int? subjectId;

  const LessonsModel({this.id, this.name, this.subjectId});

  factory LessonsModel.fromJson(Map<String, dynamic> json) => LessonsModel(
        id: json['id'] as int?,
        name: json['name'] as String?,
        subjectId: json['subjectId'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'subjectId': subjectId,
      };

  @override
  List<Object?> get props => [id, name, subjectId];
}

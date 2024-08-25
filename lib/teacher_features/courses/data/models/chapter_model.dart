import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:field_training_app/Core/api_services/end_points.dart';

class ChapterModel extends Equatable {
  final int? id;
  final int? teacherId;
  final int? subjectId;
  final String? level;
  final String? name;
  final File? file;

  const ChapterModel({
    this.id,
    this.teacherId,
    this.subjectId,
    this.level,
    this.name,
    this.file,
  });

  factory ChapterModel.fromJson(Map<String, dynamic> json) {
    return ChapterModel(
      id: json[ApiKey.id] as int?,
      teacherId: json[ApiKey.teacherId] as int?,
      subjectId: json[ApiKey.subjectId] as int?,
      level: json[ApiKey.level] as String?,
      name: json["name"] as String?,
      file: json["file"] as File?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKey.id: id,
      ApiKey.teacherId: teacherId,
      ApiKey.subjectId: subjectId,
      ApiKey.level: level,
      "name": name,
      "file": file,
    };
  }

  @override
  List<Object?> get props => [id, teacherId, subjectId, level, name, file];
}

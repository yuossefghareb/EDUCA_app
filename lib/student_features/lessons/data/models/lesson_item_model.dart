import 'package:equatable/equatable.dart';

class LessonItemModel extends Equatable {
  final int? id;
  final int? chapterId;
  final String? fileName;
  final String? contentType;
  final String? fileContent;

  const LessonItemModel({
    this.id,
    this.chapterId,
    this.fileName,
    this.contentType,
    this.fileContent,
  });

  factory LessonItemModel.fromJson(Map<String, dynamic> json) {
    return LessonItemModel(
      id: json['id'] as int?,
      chapterId: json['chapterId'] as int?,
      fileName: json['fileName'] as String?,
      contentType: json['contentType'] as String?,
      fileContent: json['fileContent'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'chapterId': chapterId,
        'fileName': fileName,
        'contentType': contentType,
        'fileContent': fileContent,
      };

  @override
  List<Object?> get props {
    return [
      id,
      chapterId,
      fileName,
      contentType,
      fileContent,
    ];
  }
}

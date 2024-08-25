import 'package:equatable/equatable.dart';
import 'package:field_training_app/Core/api_services/end_points.dart';

class FileModel extends Equatable {
  final int? id;
  final int? chapterId;
  final String? fileName;
  final String? contentType;
  final String? fileContent;

  const FileModel({
    this.id,
    this.chapterId,
    this.fileName,
    this.contentType,
    this.fileContent,
  });

  factory FileModel.fromJson(Map<String, dynamic> json) {
    return FileModel(
      id: json[ApiKey.id] as int?,
      chapterId: json[ApiKey.chapterId] as int?,
      fileName: json[ApiKey.fileName] as String?,
      contentType: json[ApiKey.contentType] as String?,
      fileContent: json[ApiKey.fileContent] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKey.id: id,
      ApiKey.chapterId: chapterId,
      ApiKey.fileName: fileName,
      ApiKey.contentType: contentType,
      ApiKey.fileContent: fileContent,
    };
  }

  @override
  List<Object?> get props => [
        id,
        chapterId,
        fileName,
        contentType,
        fileContent,
      ];
}

import 'package:equatable/equatable.dart';
import 'package:field_training_app/Core/api_services/end_points.dart';

class CourseModel extends Equatable {
  final int? id;
  final int? teacherId;
  final int? subjectId;
  final String? level;
  final String? subjectName;
  final String? addingTime;
  final String? describtion;
  final int? pricePerHour;
  final int? term;
  final int? tolalPrice;
  final bool? isActive;
  final bool? isOnline;
  final int? studentCount;

  const CourseModel({
    this.id,
    this.studentCount,
    this.teacherId,
    this.subjectId,
    this.level,
    this.subjectName,
    this.addingTime,
    this.describtion,
    this.pricePerHour,
    this.term,
    this.isActive,
    this.isOnline,
    this.tolalPrice,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      id: json[ApiKey.id] as int?,
      teacherId: json[ApiKey.teacherId] as int?,
      subjectId: json[ApiKey.subjectId] as int?,
      level: json[ApiKey.level] as String?,
      studentCount: json["studentCount"] as int?,
      subjectName: json[ApiKey.subjectName] as String?,
      addingTime: json[ApiKey.addingTime] as String?,
      describtion: json[ApiKey.describtion] as String?,
      pricePerHour: json[ApiKey.pricePerHour] as int?,
      term: json[ApiKey.term] as int?,
      isActive: json[ApiKey.isActive] as bool?,
      isOnline: json[ApiKey.isOnline] as bool?,
      tolalPrice: json[ApiKey.tolalPrice] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        ApiKey.id: id,
        ApiKey.teacherId: teacherId,
        ApiKey.subjectId: subjectId,
        ApiKey.level: level,
        ApiKey.subjectName: subjectName,
        ApiKey.addingTime: addingTime,
        ApiKey.describtion: describtion,
        ApiKey.pricePerHour: pricePerHour,
        ApiKey.term: term,
        "studentCount": studentCount,
        ApiKey.isActive: isActive,
        ApiKey.isOnline: isOnline,
        ApiKey.tolalPrice: tolalPrice,
      };

  @override
  List<Object?> get props => [
        id,
        teacherId,
        subjectId,
        level,
        subjectName,
        addingTime,
        describtion,
        pricePerHour,
        term,
        isActive,
        studentCount,
        isOnline,
        tolalPrice,
      ];
}

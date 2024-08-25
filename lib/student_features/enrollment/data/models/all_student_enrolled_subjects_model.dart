import 'package:equatable/equatable.dart';

class AllStudentEnrolledSubjectsModel extends Equatable {
  final int? id;
  final int? subjectId;
  final int? studentId;
  final String? expirationDate;
  final String? enrollmentDate;
  final bool? isActive;

  const AllStudentEnrolledSubjectsModel({
    this.id,
    this.subjectId,
    this.studentId,
    this.expirationDate,
    this.enrollmentDate,
    this.isActive,
  });

  factory AllStudentEnrolledSubjectsModel.fromJson(Map<String, dynamic> json) {
    return AllStudentEnrolledSubjectsModel(
      id: json['id'] as int?,
      subjectId: json['subjectId'] as int?,
      studentId: json['studentId'] as int?,
      expirationDate: json['expirationDate'] as String?,
      enrollmentDate: json['enrollmentDate'] as String?,
      isActive: json['isActive'] as bool?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'subjectId': subjectId,
        'studentId': studentId,
        'expirationDate': expirationDate,
        'enrollmentDate': enrollmentDate,
        'isActive': isActive,
      };

  @override
  List<Object?> get props {
    return [
      id,
      subjectId,
      studentId,
      expirationDate,
      enrollmentDate,
      isActive,
    ];
  }
}

import 'package:equatable/equatable.dart';

import 'st_dto.dart';

class AllStudentsEnrolledInSpecSubjectModel extends Equatable {
  final int? id;
  final int? studentId;
  final String? enrollmentDate;
  final StDto? stDto;

  const AllStudentsEnrolledInSpecSubjectModel({
    this.id,
    this.studentId,
    this.enrollmentDate,
    this.stDto,
  });

  factory AllStudentsEnrolledInSpecSubjectModel.fromJson(
      Map<String, dynamic> json) {
    return AllStudentsEnrolledInSpecSubjectModel(
      id: json['id'] as int?,
      studentId: json['studentId'] as int?,
      enrollmentDate: json['enrollmentDate'] as String?,
      stDto: json['stDto'] == null
          ? null
          : StDto.fromJson(json['stDto'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'studentId': studentId,
        'enrollmentDate': enrollmentDate,
        'stDto': stDto?.toJson(),
      };

  @override
  List<Object?> get props => [id, studentId, enrollmentDate, stDto];
}

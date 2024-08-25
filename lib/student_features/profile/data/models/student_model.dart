import 'package:equatable/equatable.dart';

class StudentModel extends Equatable {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final String? userName;
  final String? studentLevel;
  final String? profileImageUrl;

  const StudentModel({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.userName,
    this.studentLevel,
    this.profileImageUrl,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) => StudentModel(
        id: json['id'] as int?,
        firstName: json['firstName'] as String?,
        lastName: json['lastName'] as String?,
        email: json['email'] as String?,
        phone: json['phone'] as String?,
        userName: json['userName'] as String?,
        studentLevel: json['level'] as String?,
        profileImageUrl: json['profileImageUrl'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'phone': phone,
        'userName': userName,
        'level': studentLevel,
        'profileImageUrl': profileImageUrl,
      };

  @override
  List<Object?> get props {
    return [
      id,
      firstName,
      lastName,
      email,
      phone,
      userName,
      studentLevel,
      profileImageUrl,
    ];
  }
}

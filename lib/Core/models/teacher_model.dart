import 'package:equatable/equatable.dart';

class TeacherModel extends Equatable {
  final int? id;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? address;
  final String? phone;
  final String? governorate;
  final List<dynamic>? subjects;
  final String? profileImageUrl;

  const TeacherModel({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.address,
    this.phone,
    this.governorate,
    this.subjects,
    this.profileImageUrl,
  });

  factory TeacherModel.fromJson(Map<String, dynamic> json) {
    return TeacherModel(
      id: json['id'] as int?,
      email: json['email'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      address: json['address'] as String?,
      phone: json['phone'] as String?,
      governorate: json['governorate'] as String?,
      subjects: json['subjects'] as List<dynamic>?,
      profileImageUrl: json['profileImageUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'firstName': firstName,
        'lastName': lastName,
        'address': address,
        'phone': phone,
        'governorate': governorate,
        'subjects': subjects,
        'profileImageUrl': profileImageUrl,
      };

  @override
  List<Object?> get props {
    return [
      id,
      email,
      firstName,
      lastName,
      address,
      phone,
      governorate,
      subjects,
      profileImageUrl,
    ];
  }
}

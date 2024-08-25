import 'package:equatable/equatable.dart';

class TeacherModel extends Equatable {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final String? address;
  final String? governorate;
  final String? userName;
  final String? profileImageUrl;

  const TeacherModel({
    this.id,
    this.userName,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.address,
    this.governorate,
    this.profileImageUrl,
  });

  factory TeacherModel.fromJson(Map<String, dynamic> json) => TeacherModel(
        id: json['id'] as int?,
        userName: json['userName'] as String?,
        firstName: json['firstName'] as String?,
        lastName: json['lastName'] as String?,
        email: json['email'] as String?,
        phone: json['phone'] as String?,
        address: json['address'] as String?,
        governorate: json['governorate'] as String?,
        profileImageUrl: json['profileImageUrl'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'userName': userName,
        'phone': phone,
        'address': address,
        'governorate': governorate,
        'profileImageUrl': profileImageUrl,
      };

  @override
  List<Object?> get props {
    return [
      id,
      firstName,
      lastName,
      email,
      userName,
      phone,
      address,
      governorate,
      profileImageUrl,
    ];
  }
}

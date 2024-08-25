import 'package:equatable/equatable.dart';

class StDto extends Equatable {
  final int? id;
  final String? firstName;
  final String? lastName;
  final dynamic email;
  final dynamic phone;
  final String? level;
  final String? profileImageUrl;

  const StDto({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.level,
    this.profileImageUrl,
  });

  factory StDto.fromJson(Map<String, dynamic> json) => StDto(
        id: json['id'] as int?,
        firstName: json['firstName'] as String?,
        lastName: json['lastName'] as String?,
        email: json['email'] as dynamic,
        phone: json['phone'] as dynamic,
        level: json['level'] as String?,
        profileImageUrl: json['profileImageUrl'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'phone': phone,
        'level': level,
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
      level,
      profileImageUrl,
    ];
  }
}

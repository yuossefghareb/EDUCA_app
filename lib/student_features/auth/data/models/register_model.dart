import 'package:equatable/equatable.dart';
import 'package:field_training_app/Core/api_services/end_points.dart';

class RegisterModel extends Equatable {
  final String? code;
  final String? description;

  const RegisterModel({this.code, this.description});

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        code: json[ApiKey.code] as String?,
        description: json[ApiKey.description] as String?,
      );

  Map<String, dynamic> toJson() => {
        ApiKey.code: code,
        ApiKey.description: description,
      };

  @override
  List<Object?> get props => [code, description];
}

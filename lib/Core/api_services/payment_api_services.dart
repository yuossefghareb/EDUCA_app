import 'package:dio/dio.dart';
import 'package:field_training_app/Core/api_services/failure.dart';
import 'package:field_training_app/Core/utils/payment_constants.dart';

class PaymentApiServices {
  final Dio _dio;

//! Dio properties
  PaymentApiServices(this._dio) {
    _dio.options.baseUrl = PaymentConstants.baseUrl;
    _dio.options.receiveDataWhenStatusError = true;
    _dio.options.connectTimeout = const Duration(seconds: 15);
    _dio.options.receiveTimeout = const Duration(seconds: 15);
    _dio.options.headers = {'Content-Type': 'application/json'};
    _dio.interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
    ));
  }

//! Get Method

  Future get({required String endPoint}) async {
    try {
      final response = await _dio.get(endPoint);
      return response.data;
    } on DioException catch (e) {
      ServerFailure.fromDioError(e);
    }
  }

//! Post Method
  Future post({
    required String endPoint,
    dynamic data,
    bool isFromData = false,
  }) async {
    try {
      final response = await _dio.post(
        endPoint,
        data: isFromData ? FormData.fromMap(data) : data,
      );
      return response.data;
    } on DioException catch (e) {
      ServerFailure.fromDioError(e);
    }
  }
}

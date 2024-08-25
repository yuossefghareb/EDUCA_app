import 'package:dio/dio.dart';
import 'package:field_training_app/Core/api_services/api_requests.dart';
import 'package:field_training_app/Core/api_services/end_points.dart';
import 'package:field_training_app/Core/api_services/failure.dart';

class ApiServices extends ApiRequests {
  final Dio _dio;

//! Dio properties
  ApiServices(this._dio) {
    _dio.options.baseUrl = EndPoint.baseUrl;
    _dio.options.receiveDataWhenStatusError = true;
    _dio.options.connectTimeout = const Duration(seconds: 15);
    _dio.options.receiveTimeout = const Duration(seconds: 15);
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
  @override
  Future get({required String endPoint}) async {
    try {
      final response = await _dio.get(endPoint);
      return response.data;
    } on DioException catch (e) {
      ServerFailure.fromDioError(e);
    }
  }

//! Post Method
  @override
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

//! put Method
  @override
  Future put({
    required String endPoint,
    dynamic data,
    bool isFromData = false,
  }) async {
    try {
      final response = await _dio.put(
        endPoint,
        data: isFromData ? FormData.fromMap(data) : data,
      );
      return response.data;
    } on DioException catch (e) {
      ServerFailure.fromDioError(e);
    }
  }

//! Delete Method
  @override
  Future delete(
    String endPoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFromData = false,
  }) async {
    try {
      final response = await _dio.delete(
        endPoint,
        data: isFromData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      ServerFailure.fromDioError(e);
    }
  }
}

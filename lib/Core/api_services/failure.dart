import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;
  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('انتهت مهلة الاتصال بالخادم');
      case DioExceptionType.sendTimeout:
        return ServerFailure('انتهت مهلة الارسال للخادم');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('انتهت مهلة استقبال الخادم');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode!, dioError.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('تم الغاء الطلب');
      case DioExceptionType.connectionError:
        return ServerFailure('لا يوجد انترنت');
      case DioExceptionType.unknown:
        return ServerFailure('حدث خطأ غير معروف');
      case DioExceptionType.badCertificate:
        return ServerFailure('خطأ في تحقق من الشهادة');
      default:
        return ServerFailure('حدث خطأ غير معروف');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      //! response['error']['message'] --> depend on Api and can change.
      //return ServerFailure(response[ApiKey.description]);
      return ServerFailure("errrrrrrrror!");
    } else if (statusCode == 404) {
      return ServerFailure('لم يتم العثور علي طلبك');
    } else if (statusCode == 500) {
      return ServerFailure('خطأ في الخادم');
    } else {
      return ServerFailure('حدث خطأ غير معروف');
    }
  }
}

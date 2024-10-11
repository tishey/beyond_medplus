import 'package:dio/dio.dart';

class DioExceptions implements Exception {
  late String message;

  DioExceptions.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.cancel:
        message = "Request to API server was cancelled";
        break;
      case DioExceptionType.connectionTimeout:
        message = "Connection timeout, please check your internet connection";
        break;
      case DioExceptionType.receiveTimeout:
        message = "Receive timeout, please check your internet connections";
        break;
      case DioExceptionType.badResponse:
        message = _handleError(
          dioError.response?.statusCode,
          dioError.response?.data,
        );
        break;
      case DioExceptionType.sendTimeout:
        message = "Send timeout in connection with API server";
        break;
      case DioExceptionType.unknown:
        message = "Unexpected error occurred";
        break;
      case DioExceptionType.connectionError:
        message =
            "Unable to connect, please check your internet and try again...";
      default:
        message = "Something went wrong";
        break;
    }
  }

  String _handleError(int? statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return error['message'];
      case 401:
        return error['message'];
      case 403:
        return 'Forbidden';
      case 404:
        return error['message'];
      case 500:
        return error['message']; //'Internal server error';
      case 422:
        return error['message'];
      case 502:
        return error['message'];
      case 521:
        return error['message'];
      default:
        return error['message'];
    }
  }

  @override
  String toString() => message;
}

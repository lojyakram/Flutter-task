import 'package:dio/dio.dart';
import 'package:my_first_app/core/networking/api_error_model.dart';

class ApiErrorHandler {
  final String message;
  final int? statusCode;

  ApiErrorHandler._(this.message, this.statusCode);

  static ApiErrorHandler handle(Object error) {
    if (error is DioException) {
      final statusCode = error.response?.statusCode;

      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return ApiErrorHandler._(
              'Connection timed out. Please try again', statusCode);

        case DioExceptionType.connectionError:
          return ApiErrorHandler._(
              'No internet connection. Please check your network', statusCode);

        case DioExceptionType.badCertificate:
          return ApiErrorHandler._('Security certificate error', statusCode);

        case DioExceptionType.badResponse:
          ApiErrorModel apiErrorModel = ApiErrorModel.fromJson(
              error.response?.data);
          return ApiErrorHandler._(apiErrorModel.message ?? "", statusCode);

        case DioExceptionType.cancel:
          return ApiErrorHandler._('Request was cancelled', statusCode);

        case DioExceptionType.unknown:
          return ApiErrorHandler._(
              'Something went wrong. Please try again', statusCode);
        case DioExceptionType.transformTimeout:
        // TODO: Handle this case.
          throw UnimplementedError();
      }
    }
    return ApiErrorHandler._('An unexpected error occurred', null);
  }
}

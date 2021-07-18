import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

/// error helper
class ErrorHelper {
  /// error type checker
  String getErrorType(DioError error) {
    String errorDescription = '';

    switch (error.type) {
      case DioErrorType.cancel:
        errorDescription = "Request to API server was cancelled";
        break;
      case DioErrorType.connectTimeout:
        errorDescription = "Connection timeout with API server";
        break;
      case DioErrorType.other:
        errorDescription = error.message;
        break;
      case DioErrorType.receiveTimeout:
        errorDescription = "Receive timeout in connection with API server";
        break;
      case DioErrorType.response:
        debugPrint('response  status -- ${error.response}');
        if (error.response!.statusCode == null) {
          errorDescription = 'Unknown error';
          break;
        }
        if (error.response!.statusCode == 401) {
          errorDescription = 'Token Expired';
        } else if (error.response!.statusCode == 500) {
          errorDescription =
              'something went wrong, please try after some time ';
        } else if (error.response!.statusCode == 404) {
          Map<String, dynamic> response = error.response!.data;

          if (response.containsKey('message')) {
            errorDescription = response['message'];
          }
        } else if (error.response!.data != null &&
            !(error.response!.data is String)) {
          Map<String, dynamic> responce = error.response!.data;
          debugPrint("error---------------$responce");
          if (responce.containsKey('error') &&
              !(responce is String) &&
              responce['error'] != null) {
            errorDescription = "${responce['error']}";
          } else if (responce.containsKey('detail') &&
              !(responce is String) &&
              responce['detail'] != null) {
            errorDescription = "${responce['detail']}";
          }
        } else
          errorDescription = 'Unknown error';
        break;
      case DioErrorType.sendTimeout:
        errorDescription =
            "Received invalid status code: ${error.response!.statusCode}";
        break;
      default:
        errorDescription = "Unknown error";
        break;
    }

    return errorDescription;
  }
}

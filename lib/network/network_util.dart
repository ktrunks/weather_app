import 'dart:async';

import 'package:dio/dio.dart';
import 'package:weather/helper/error_helper.dart';

/// Network util core api call class
class NetworkUtil {
  /// singleton instance
  factory NetworkUtil() => _instance;

  /// setting api call logger
  NetworkUtil.internal() {
    setupInterceptors();
  }

  static final NetworkUtil _instance = NetworkUtil.internal();

  /// dio library instance initializing
  Dio dio = Dio();

  /// dio get api call
  Future<dynamic> get(Uri uri, {required Map<String, dynamic> params}) {
    return dio.get(uri.toString(), queryParameters: params).then((response) {
      /// api response
      final dynamic res = response.data;
      if (response.statusCode == 401) {
        return 'Invalid Token';
      }
      if (response.statusCode! < 200 || response.statusCode! > 410) {
        throw Exception("Error while fetching data");
      }
      return res;
    }, onError: (error) {
      if (error is DioError &&
              ErrorHelper().getErrorType(error) ==
                  'Received invalid status code: Unauthorized' ||
          ErrorHelper().getErrorType(error) == 'Token Expired') {
        return 'Invalid Token';
      } else
        return error;
    });
  }

  /// dio api logger
  void setupInterceptors() {
    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
  }
}

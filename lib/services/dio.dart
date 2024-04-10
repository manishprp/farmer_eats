import "package:dio/dio.dart";

import "../constants/app_strings.dart";

class Client {
  Dio init() {
    Dio dio = Dio();
    dio.options.baseUrl = Appstrings.baseUrl;
    dio.options.headers['accept'] = 'application/json';
    dio.options.headers['Content-Type'] = 'application/json';
    return dio;
  }
}

class ApiInterceptors extends Interceptor {}

import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import '../../constants/endpoints.dart';

abstract class NetworkModule {
  static Dio provideDio() {
    final dio = Dio();

    dio
      ..options.baseUrl = Endpoints.baseUrl
      ..options.receiveDataWhenStatusError = true
      ..options.connectTimeout = 30 * 1000 // 30 seconds
      ..options.receiveTimeout = 30 * 1000 // 30 seconds
      ..options.headers = {
        'Accept': "application/json",
        'Content-Type': "application/json",
      }
      ..interceptors.add(LogInterceptor(
        error: false,
        responseHeader: false,
        request: false,
        responseBody: false,
        requestBody: false,
        requestHeader: false,
      ));

    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    return dio;
  }
}

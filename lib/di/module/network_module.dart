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
      ..options.connectTimeout = 120 * 1000 // 60 seconds
      ..options.receiveTimeout = 120 * 1000 // 60 seconds
      ..options.headers = {
        'Accept': "application/json",
        'Content-Type': "application/json",
      }
      ..interceptors.add(LogInterceptor(
        error: true,
        responseHeader: true,
        request: true,
        responseBody: true,
        requestBody: true,
        requestHeader: true,
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

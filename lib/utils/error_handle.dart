import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

/*
String handleError(DioError error) {
  String errorDescription = '';
  if (error is DioError) {
    DioError dioError = error;
    switch (dioError.type) {
      case DioErrorType.cancel:
        errorDescription = "Request to API server was cancelled";
        break;
      case DioErrorType.connectTimeout:
        errorDescription = "Connection timeout with API server";
        break;
      case DioErrorType.receiveTimeout:
        errorDescription = "Receive timeout in connection with API server";
        break;
      case DioErrorType.response:
        errorDescription = error.response?.data;
        break;
      case DioErrorType.sendTimeout:
        errorDescription = "Send timeout in connection with API server";
        break;
      default:
        errorDescription = "Send timeout in connection with API server";
        break;
    }
  } else {
    errorDescription = "Unexpected error occured";
  }
  return errorDescription;
}*/

dynamic handleError(dynamic e) {
  dynamic data = {"statusCode": -1, "message": "Unknown Error"};
  if (e is DioError) {
    if (e.type == DioErrorType.response) {
      final response = e.response;
      try {
        if (response != null && response.data != null) {
          final Map responseData =
              json.decode(json.encode(response.data)) as Map;
          final jsonError = (responseData['result'])['error'];
          data["message"] = json.encode(jsonError);
          data["statusCode"] = response.statusCode;
        }
      } catch (e) {
        data["message"] = "Internal Error Catch";
      }
    } else if (e.type == DioErrorType.connectTimeout ||
        e.type == DioErrorType.receiveTimeout ||
        e.type == DioErrorType.sendTimeout) {
      data["message"] = "Request timeout";
      data["statusCode"] = 408;
    } else if (e.error is SocketException) {
      data["message"] = "No Internet Connection!";
    }
  }
  return data;
}

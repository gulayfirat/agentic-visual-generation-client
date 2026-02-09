import 'dart:developer';

import 'package:dio/dio.dart';

class HandleServiceError {
  void handleError(DioException error) {
    switch (error.type) {
      case DioException.connectionError:
        log('Connection time exceeded!');
        break;
      case DioException.sendTimeout:
        log('Request submission time exceeded!');
        break;
      case DioException.receiveTimeout:
        log('Response time exceeded!');
        break;
      case DioException.badResponse:
        if (error.response?.statusCode == 404) {
          log('Source not found (404)');
        } else if (error.response?.statusCode == 500) {
          log('Server error (500)');
        } else {
          log('Error: ${error.response?.statusCode}');
        }
        break;
      case DioException.requestCancelled:
        log('Request cancelled!');
        break;
      default:
        log('An unknown error occurred!');
    }
  }
}

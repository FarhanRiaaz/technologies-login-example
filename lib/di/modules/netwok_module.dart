import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:technologies_login_example/data/network/constants/endpoints.dart';
import 'package:technologies_login_example/data/network/intercepters/retry_interceptor.dart';
import 'package:technologies_login_example/data/sharedpref/shared_preference_helper.dart';
import 'package:technologies_login_example/di/modules/logging_interceptor.dart';

abstract class NetworkModule {
  /// A singleton dio provider.
  ///
  /// Calling it multiple times will return the same instance.
  static Dio provideDio(SharedPreferenceHelper? sharedPrefHelper) {
    final dio = Dio();
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    dio
      ..options.baseUrl = Endpoints.baseUrl
      ..options.connectTimeout = Endpoints.connectionTimeout
      ..options.receiveTimeout = Endpoints.receiveTimeout
      ..options.headers = {'Content-Type': 'application/json; charset=utf-8'}
      ..interceptors.addAll([
        LoggingInterceptor(),
        RetryInterceptor(
          dio: dio,
          options: const RetryOptions(
            retries: Endpoints.retryAttempts,
            retryInterval: Endpoints.retryInterval,
          ),
        ),
        InterceptorsWrapper(
          onRequest: (RequestOptions options,
              RequestInterceptorHandler handler) async {
            return handler.next(options);
          },
          onError: (DioError e, handler) async {
            if (e.type == DioErrorType.connectTimeout ||
                e.type == DioErrorType.sendTimeout ||
                e.type == DioErrorType.receiveTimeout) {
              if (kDebugMode) {
                print("Timeout/internet problem");
              }
            }
            if (e.response != null) {
              if (e.response!.statusCode == 404) {
                if (kDebugMode) {
                  print("Not responding");
                }
              } else {
                handler.next(e);
              }
            }
          },
        ),
      ]);

    return dio;
  }
}

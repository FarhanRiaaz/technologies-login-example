import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioClient {
  final String _tag = "DioClient";

  // dio instance
  final Dio? _dio;

  // injecting dio instance
  DioClient(this._dio);

//   // Get:-----------------------------------------------------------------------
  Future<dynamic> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio!.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );

      if (kDebugMode) {
        print(
            'DIO Get, $uri \n params: $queryParameters , \n Response : ${jsonEncode(response.data)}');
      }
      return response.data;
    } catch (e, s) {
      if (kDebugMode) {
        print("$e, $s, get");
        print("$_tag, get, error, $e");
      }
      _doIfInternetError(e);
    }
  }

  // Post:----------------------------------------------------------------------
  Future<dynamic> post(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    BaseOptions? baseOptions,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio!.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      if (kDebugMode) {
        print(
            'DIO Post, $uri \n body: ${jsonEncode(data)} , \n Response : ${jsonEncode(response.data)}');
      }
      return response.data;
    } catch (e, s) {
      if (kDebugMode) {
        print("$e, $s, post");
        print("$_tag, post  error, $e");
      }
      _doIfInternetError(e);
    }
  }

  // Put:----------------------------------------------------------------------
  Future<dynamic> put(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio!.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      if (kDebugMode) {
        print(
            'DIO Put, $uri \n body: ${jsonEncode(data)} , \n Response : ${jsonEncode(response.data)}');
      }
      return response.data;
    } catch (e, s) {
      if (kDebugMode) {
        print("$e, $s, put");
        print("$_tag, put  error, $e");
      }
      _doIfInternetError(e);
    }
  }

  // Patch:----------------------------------------------------------------------
  Future<dynamic> patch(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio!.patch(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      if (kDebugMode) {
        print(
            'DIO Patch, $uri \n body: ${jsonEncode(data)} , \n Response : ${jsonEncode(response.data)}');
      }
      return response.data;
    } catch (e, s) {
      if (kDebugMode) {
        print("$e, $s, patch");
        print("$_tag, patch  error, $e");
      }
      _doIfInternetError(e);
    }
  }

  void _doIfInternetError(e) {
    if (e.toString().contains("Failed host lookup:")) {
      throw Exception("Not connected to internet!");
    } else {
      Future.error(e);
    }
  }
}

import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:technologies_login_example/data/network/constants/endpoints.dart';
import 'package:technologies_login_example/domain/models/login/login_request.dart';
import 'package:technologies_login_example/domain/models/login/login_response.dart';
import '../../dio_client.dart';

class UsersApi {
  // dio instance
  final DioClient? _dioClient;

  // injecting dio instance
  UsersApi(this._dioClient);

  // Generate an SMS for a registered user
  Future<LoginResponse?> loginUser(LoginRequest request) async {
    try {
      final res = await _dioClient!.post(
          "${Endpoints.login}?email=${request.email}&password=${request.password}");
      if (res != null) {
        return LoginResponse.fromJson(res);
      } else {
        return LoginResponse();
      }
    } catch (e, s) {
      if (kDebugMode) {
        print("registerUser $e $s");
      }
      Future.error(e);
    }
  }
}

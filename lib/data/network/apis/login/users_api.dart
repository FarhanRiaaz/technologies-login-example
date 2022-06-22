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
  Future<LoginResponse?> registerUser(LoginRequest request) async {
    try {
      var req = request.toJson();
      final res = await _dioClient!.post(Endpoints.login, data: req);
      if (res != null) {
        return LoginResponse.fromJson(res);
      } else {
        throw Future.error(Exception("Null response received!"));
      }
    } catch (e, s) {
      if (kDebugMode) {
        print("registerUser $e $s");
      }
      Future.error(e);
    }
  }
}

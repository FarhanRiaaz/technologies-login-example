import 'dart:async';

import 'package:technologies_login_example/data/local/dataSources/user_dataSource.dart';
import 'package:technologies_login_example/data/network/apis/login/users_api.dart';
import 'package:technologies_login_example/domain/models/login/login_request.dart';
import 'package:technologies_login_example/domain/models/login/login_response.dart';

class UserRepository {
  // data source object
  final UserDataSource? _userDataSource;

  // api objects
  final UsersApi? _userApi;

  // constructor
  UserRepository(this._userApi, this._userDataSource);

  // Users: ---------------------------------------------------------------------
  Future<int?> insertUser(User user) => _userDataSource!
      .insertOrUpdate(user)
      .then((id) => id)
      .catchError((error) => Future.error(error));

  Future<List<User>> getUser() => _userDataSource!
      .getUserInfo()
      .then((value) => value)
      .catchError((error) => throw error);

  // Register:------------------------------------------------------------------
  Future<LoginResponse> loginUser(LoginRequest request) async {
    return await _userApi!.loginUser(request).then((result) {
      if (result != null) {
        return result;
      } else {
        return LoginResponse();
      }
    });
  }
}

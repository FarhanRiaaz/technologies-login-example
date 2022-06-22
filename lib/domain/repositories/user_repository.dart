import 'dart:async';

import 'package:technologies_login_example/data/network/apis/login/users_api.dart';
import 'package:technologies_login_example/domain/models/login/login_request.dart';
import 'package:technologies_login_example/domain/models/login/login_response.dart';


class UserRepository {


  // api objects
  final UsersApi? _userApi;

  // constructor
  UserRepository(this._userApi);

  // Users: ---------------------------------------------------------------------
  Future<int?> insertUser(User user) =>
      _userDataSource!
          .insertOrUpdate(user)
          .then((id) => id)
          .catchError((error) => Future.error(error));

  Future<List<User>> getUser() =>
      _userDataSource!
          .getUserInfo()
          .then((value) => value)
          .catchError((error) => throw error);

  // Register:------------------------------------------------------------------
  Future<LoginResponse> register(LoginRequest request) async {
    return await _userApi!
        .registerUser(request)
        .then((result) {
      if (result != null) {

      } else {

      }
    } else {

    }
    }

  );
}

}

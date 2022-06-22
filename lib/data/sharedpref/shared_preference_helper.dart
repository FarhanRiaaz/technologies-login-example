import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants/preferences.dart';

@singleton
class SharedPreferenceHelper {
  // shared pref instance
  final Future<SharedPreferences> _sharedPreference;

  // constructor
  SharedPreferenceHelper(this._sharedPreference);

  // General Methods: ----------------------------------------------------------

  Future<void> saveUserName(String username) async {
    return _sharedPreference.then((preference) {
      preference.setString(Preferences.user_name, username);
    });
  }

  Future<String?> get userName async {
    return _sharedPreference.then((preference) {
      return preference.getString(Preferences.user_name);
    });
  }

  // Login:---------------------------------------------------------------------
  Future<bool> get isLoggedIn async {
    return _sharedPreference.then((preference) {
      return preference.getBool(Preferences.is_logged_in) ?? false;
    });
  }

  Future<void> saveIsLoggedIn(bool value) async {
    return _sharedPreference.then((preference) {
      preference.setBool(Preferences.is_logged_in, value);
    });
  }

  Future<int> get lastLogTime {
    return _sharedPreference.then((prefs) {
      return prefs.getInt(Preferences.last_log_time) ?? 0;
    });
  }

  Future<void> setLastLogTime(int value) {
    return _sharedPreference.then((prefs) {
      prefs.setInt(Preferences.last_log_time, value);
    });
  }
}

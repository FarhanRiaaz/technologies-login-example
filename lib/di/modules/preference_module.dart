import 'package:shared_preferences/shared_preferences.dart';

class PreferenceModule {
  // DI variables:--------------------------------------------------------------

  // DI Providers:--------------------------------------------------------------
  /// A singleton preference provider.
  ///
  /// Calling it multiple times will return the same instance.

  static Future<SharedPreferences> provideSharedPreferences() {
    return SharedPreferences.getInstance();
  }
}
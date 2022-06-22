class Endpoints {
  Endpoints._();

  // base url
  static final String baseUrl = Endpoints._getBaseURL();

  // receiveTimeouts
  static const int receiveTimeout = 20000;

  // connectTimeout
  static const int connectionTimeout = 20000;
  static const int retryAttempts = 3;
  static const Duration retryInterval = Duration(seconds: 10);

  // login endpoints
  static String login = baseUrl + "/auth/login";

  static String _getBaseURL() {
    return 'https://staging.wikwik.app/api';
  }
}

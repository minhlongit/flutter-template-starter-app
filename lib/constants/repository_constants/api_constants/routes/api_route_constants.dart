import 'package:flutter/foundation.dart';

class ApiRouteConstants {
  static String getBaseUrl() {
    // Check if in debug mode
    if (kDebugMode) {
      // Return URL for development environment
      return "https://route.it";
    } else {
      // If not in debug mode, throw an exception as production environment is not supported yet
      throw Exception("Production mode is not supported yet");
    }
  }

  // Base path for API
  static String basePath = "/api/v1";

  // Path to obtain token
  static String tokenPath = "/token/";

  // Path to refresh token, using the defined tokenPath
  static String refreshTokenPath = "${tokenPath}refresh/";
}

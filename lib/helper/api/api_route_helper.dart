import 'package:starter_app/constants/repository_constants/api_constants/routes/api_route_constants.dart';

// The ApiRouteHelper class contains helper methods related to API routes.
class ApiRouteHelper {
  // The static method getBaseUrl returns the base URL for API requests.
  // It combines the root URL (getBaseUrl) and the base path (basePath) from ApiRouteConstants.
  static String getBaseUrl() =>
      "${ApiRouteConstants.getBaseUrl()}${ApiRouteConstants.basePath}/";
}

// Import các hằng số đường dẫn API từ một package nội bộ.
import 'package:starter_app/constants/repository_constants/api_constants/routes/api_route_constants.dart';

// Lớp ApiRouteHelper chứa các phương thức trợ giúp liên quan đến đường dẫn API.
class ApiRouteHelper {
  // Phương thức tĩnh getBaseUrl trả về URL cơ bản cho các yêu cầu API.
  // Nó kết hợp URL gốc (getBaseUrl) và đường dẫn cơ bản (basePath) từ ApiRouteConstants.
  static String getBaseUrl() =>
      "${ApiRouteConstants.getBaseUrl()}${ApiRouteConstants.basePath}/";
}

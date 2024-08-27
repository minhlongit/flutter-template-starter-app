import 'package:flutter/foundation.dart';

// Định nghĩa lớp ApiRouteConstants để quản lý các hằng số đường dẫn API
class ApiRouteConstants {
  // Phương thức tĩnh getBaseUrl trả về URL cơ sở của API
  static String getBaseUrl() {
    // Kiểm tra nếu đang ở chế độ debug
    if (kDebugMode) {
      // Trả về URL cho môi trường phát triển
      return "https://route.it";
    } else {
      // Nếu không phải chế độ debug, ném ra ngoại lệ vì chưa hỗ trợ môi trường sản xuất
      throw Exception("Production mode is not supported yet");
    }
  }

  // Định nghĩa các hằng số đường dẫn API
  // Đường dẫn cơ sở cho API
  static String basePath = "/api/v1";

  // Đường dẫn để lấy token
  static String tokenPath = "/token/";

  // Đường dẫn để làm mới token, sử dụng đường dẫn tokenPath đã định nghĩa
  static String refreshTokenPath = "${tokenPath}refresh/";
}

// Lớp ngoại lệ cho trường hợp không có kết nối Internet.
class NoInternetConnectionException implements Exception {
  // Khởi tạo một instance của NoInternetConnectionException.
  const NoInternetConnectionException() : super();
}

// Lớp ngoại lệ cho trường hợp máy chủ trả về lỗi 500 (Internal Server Error).
class InternalServerErrorException implements Exception {
  // Mô tả chi tiết về lỗi, có thể được cung cấp khi khởi tạo.
  String description;
  // Khởi tạo một instance với mô tả lỗi, mặc định là chuỗi rỗng.
  InternalServerErrorException({this.description = ""}) : super();
}

// Lớp ngoại lệ cho trường hợp yêu cầu đến một điểm cuối (endpoint) không tồn tại, dẫn đến lỗi 404.
class NotFoundEndPointException implements Exception {
  // Khởi tạo một instance của NotFoundEndPointException.
  const NotFoundEndPointException() : super();
}

// Lớp ngoại lệ cho trường hợp yêu cầu không hợp lệ, dẫn đến lỗi 400 (Bad Request).
class BadRequestException implements Exception {
  // Mô tả chi tiết về lỗi, cần được cung cấp khi khởi tạo.
  String description;
  // Khởi tạo một instance với mô tả lỗi.
  BadRequestException(this.description) : super();
}

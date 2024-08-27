// Lớp ngoại lệ cho trường hợp không được ủy quyền, thường được sử dụng khi một yêu cầu đến máy chủ không có quyền truy cập cần thiết.
class UnauthorizedException implements Exception {
  // Khởi tạo một instance của UnauthorizedException.
  const UnauthorizedException() : super();
}

// Lớp ngoại lệ cho trường hợp token làm mới (refresh token) hết hạn.
// Điều này thường xảy ra khi ứng dụng cần làm mới token truy cập nhưng refresh token đã không còn hợp lệ.
class RefreshTokenExpiredException implements Exception {
  // Khởi tạo một instance của RefreshTokenExpiredException.
  const RefreshTokenExpiredException() : super();
}

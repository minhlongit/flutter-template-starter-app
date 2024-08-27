// Lớp JwtTokenKeys chứa các khóa được sử dụng để lưu trữ và truy cập token JWT trong ứng dụng
class JwtTokenKeys {
  // accessTokenKey là khóa dùng để lưu trữ hoặc truy cập access token
  static const String accessTokenKey = "accessTokenKey";
  // refreshTokenKey là khóa dùng để lưu trữ hoặc truy cập refresh token
  static const String refreshTokenKey = "refreshTokenKey";
}

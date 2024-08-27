import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:starterapp/constants/repository_constants/api_constants/auth/api_token_constants.dart';
import 'package:starterapp/repository/local_storage/auth/jwt_local_storage.dart';

class JwtTokenHelper {
  // Khởi tạo trình xử lý lưu trữ cục bộ cho JWT.
  JwtLocalStorage jwtLocalStorage = JwtLocalStorage();

  // Kiểm tra xem JWT token có tồn tại trong lưu trữ cục bộ hay không.
  Future<bool> existJwtToken() => jwtLocalStorage.existJwtToken();

  // Kiểm tra xem refresh token có tồn tại trong lưu trữ cục bộ hay không.
  Future<bool> existRefreshToken() => jwtLocalStorage.existRefreshToken();

  // Lưu mới JWT và refresh tokens vào lưu trữ cục bộ.
  Future<void> saveNewJwtTokens(String accessToken, String refreshToken) async {
    await jwtLocalStorage.saveAccessToken(accessToken); // Lưu access token.
    await jwtLocalStorage.saveRefreshToken(refreshToken); // Lưu refresh token.
  }

  // Lấy access token từ lưu trữ cục bộ.
  Future<String> getAccessToken() => jwtLocalStorage.getAccessToken();

  // Lấy refresh token từ lưu trữ cục bộ.
  Future<String> getRefreshToken() => jwtLocalStorage.getRefreshToken();

  // Kiểm tra xem access token lưu trữ có hợp lệ hay không.
  Future<bool> isValidAccessToken() async {
    if (!await existJwtToken()) {
      // Nếu không tồn tại JWT token, trả về false.
      return false;
    }
    try {
      String token = await getAccessToken(); // Lấy access token.
      _verifyToken(token); // Xác minh tính hợp lệ của token.
    } on JWTExpiredException {
      // Nếu token đã hết hạn, xóa tokens và trả về false.
      await clearJwtTokens();
      return false;
    } on JWTException {
      // Nếu có ngoại lệ liên quan đến JWT, xóa tokens và trả về false.
      await clearJwtTokens();
      return false;
    }
    return true; // Nếu không có ngoại lệ, token hợp lệ.
  }

  // Kiểm tra xem refresh token lưu trữ có hợp lệ hay không.
  Future<bool> isValidRefreshToken() async {
    if (!await existRefreshToken()) {
      // Nếu không tồn tại refresh token, trả về false.
      return false;
    }
    try {
      String token = await getRefreshToken(); // Lấy refresh token.
      _verifyToken(token); // Xác minh tính hợp lệ của token.
    } on JWTExpiredException {
      // Nếu token đã hết hạn, trả về false.
      return false;
    } on JWTException {
      // Nếu có ngoại lệ liên quan đến JWT, trả về false.
      return false;
    }
    return true; // Nếu không có ngoại lệ, token hợp lệ.
  }

  // Xác minh tính hợp lệ của một token sử dụng cụm từ bí mật.
  _verifyToken(String token) =>
      JWT.verify(token, SecretKey(JwtTokenConstants.jwtSecretPhrase));

  // Xóa tất cả JWT tokens khỏi lưu trữ cục bộ.
  Future<void> clearJwtTokens() => jwtLocalStorage.clearJwtTokens();
}

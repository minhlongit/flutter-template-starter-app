import 'package:starter_app/constants/repository_constants/local_storage_constants/auth/jwt_token_keys.dart';
import 'package:starter_app/repository/local_storage/base/local_storage_core.dart';

class JwtLocalStorage {
  // Tạo một đối tượng LocalStorageCore để tương tác với bộ nhớ cục bộ.
  LocalStorageCore localStorageCore = LocalStorageCore();

  // Phương thức kiểm tra xem access token có tồn tại trong bộ nhớ cục bộ hay không.
  Future<bool> existJwtToken() async {
    return await localStorageCore.exist(JwtTokenKeys.accessTokenKey);
  }

  // Phương thức kiểm tra xem refresh token có tồn tại trong bộ nhớ cục bộ hay không.
  Future<bool> existRefreshToken() async {
    return await localStorageCore.exist(JwtTokenKeys.refreshTokenKey);
  }

  // Phương thức lưu access token vào bộ nhớ cục bộ.
  Future<void> saveAccessToken(String token) async {
    await localStorageCore.save(JwtTokenKeys.accessTokenKey, token);
  }

  // Phương thức lưu refresh token vào bộ nhớ cục bộ.
  Future<void> saveRefreshToken(String token) async {
    await localStorageCore.save(JwtTokenKeys.refreshTokenKey, token);
  }

  // Phương thức lấy access token từ bộ nhớ cục bộ.
  Future<String> getAccessToken() async {
    return await localStorageCore.read(JwtTokenKeys.accessTokenKey);
  }

  // Phương thức lấy refresh token từ bộ nhớ cục bộ.
  Future<String> getRefreshToken() async {
    return await localStorageCore.read(JwtTokenKeys.refreshTokenKey);
  }

  // Phương thức xóa cả access token và refresh token từ bộ nhớ cục bộ.
  Future<void> clearJwtTokens() async {
    await localStorageCore
        .remove(JwtTokenKeys.accessTokenKey); // Xóa access token
    await localStorageCore
        .remove(JwtTokenKeys.refreshTokenKey); // Xóa refresh token
  }
}

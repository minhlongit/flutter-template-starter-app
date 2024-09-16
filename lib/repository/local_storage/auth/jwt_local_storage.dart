import 'package:starter_app/repository/local_storage/base/local_storage_core.dart';
import 'package:starter_app/constants/repository_constants/local_storage_constants/auth/jwt_token_keys.dart';

class JwtLocalStorage {
  // Create a LocalStorageCore object to interact with local storage.
  LocalStorageCore localStorageCore = LocalStorageCore();

  // Method to check if the access token exists in local storage.
  Future<bool> existJwtToken() async {
    return await localStorageCore.exist(JwtTokenKeys.accessTokenKey);
  }

  // Method to check if the refresh token exists in local storage.
  Future<bool> existRefreshToken() async {
    return await localStorageCore.exist(JwtTokenKeys.refreshTokenKey);
  }

  // Method to save the access token into local storage.
  Future<void> saveAccessToken(String token) async {
    await localStorageCore.save(JwtTokenKeys.accessTokenKey, token);
  }

  // Method to save the refresh token into local storage.
  Future<void> saveRefreshToken(String token) async {
    await localStorageCore.save(JwtTokenKeys.refreshTokenKey, token);
  }

  // Method to retrieve the access token from local storage.
  Future<String> getAccessToken() async {
    return await localStorageCore.read(JwtTokenKeys.accessTokenKey);
  }

  // Method to retrieve the refresh token from local storage.
  Future<String> getRefreshToken() async {
    return await localStorageCore.read(JwtTokenKeys.refreshTokenKey);
  }

  // Method to delete both the access token and refresh token from local storage.
  Future<void> clearJwtTokens() async {
    // Delete access token
    await localStorageCore.remove(JwtTokenKeys.accessTokenKey);
    // Delete refresh token
    await localStorageCore.remove(JwtTokenKeys.refreshTokenKey);
  }
}

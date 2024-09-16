import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:starter_app/repository/local_storage/auth/jwt_local_storage.dart';
import 'package:starter_app/constants/repository_constants/api_constants/auth/api_token_constants.dart';

class JwtTokenHelper {
  // Initialize the local storage handler for JWT.
  JwtLocalStorage jwtLocalStorage = JwtLocalStorage();

  // Check if the JWT token exists in local storage.
  Future<bool> existJwtToken() => jwtLocalStorage.existJwtToken();

  // Check if the refresh token exists in local storage.
  Future<bool> existRefreshToken() => jwtLocalStorage.existRefreshToken();

  // Save new JWT and refresh tokens to local storage.
  Future<void> saveNewJwtTokens(String accessToken, String refreshToken) async {
    await jwtLocalStorage.saveAccessToken(accessToken); // Save access token.
    await jwtLocalStorage.saveRefreshToken(refreshToken); // Save refresh token.
  }

  // Get the access token from local storage.
  Future<String> getAccessToken() => jwtLocalStorage.getAccessToken();

  // Get the refresh token from local storage.
  Future<String> getRefreshToken() => jwtLocalStorage.getRefreshToken();

  // Check if the stored access token is valid.
  Future<bool> isValidAccessToken() async {
    if (!await existJwtToken()) {
      // If JWT token doesn't exist, return false.
      return false;
    }
    try {
      String token = await getAccessToken(); // Get the access token.
      _verifyToken(token); // Verify the validity of the token.
    } on JWTExpiredException {
      // If the token has expired, clear the tokens and return false.
      await clearJwtTokens();
      return false;
    } on JWTException {
      // If there's a JWT-related exception, clear the tokens and return false.
      await clearJwtTokens();
      return false;
    }
    return true; // If no exception, the token is valid.
  }

  // Check if the stored refresh token is valid.
  Future<bool> isValidRefreshToken() async {
    if (!await existRefreshToken()) {
      // If refresh token doesn't exist, return false.
      return false;
    }
    try {
      String token = await getRefreshToken(); // Get the refresh token.
      _verifyToken(token); // Verify the validity of the token.
    } on JWTExpiredException {
      // If the token has expired, return false.
      return false;
    } on JWTException {
      // If there's a JWT-related exception, return false.
      return false;
    }
    return true; // If no exception, the token is valid.
  }

  // Verify the validity of a token using the secret phrase.
  _verifyToken(String token) =>
      JWT.verify(token, SecretKey(JwtTokenConstants.jwtSecretPhrase));

  // Clear all JWT tokens from local storage.
  Future<void> clearJwtTokens() => jwtLocalStorage.clearJwtTokens();
}

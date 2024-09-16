// Exception class for unauthorized cases, typically used when a request to the server lacks the necessary access permissions.
class UnauthorizedException implements Exception {
  // Initialize an instance of UnauthorizedException.
  const UnauthorizedException() : super();
}

// Exception class for cases when the refresh token has expired.
// This typically occurs when the application needs to refresh the access token but the refresh token is no longer valid.
class RefreshTokenExpiredException implements Exception {
  // Initialize an instance of RefreshTokenExpiredException.
  const RefreshTokenExpiredException() : super();
}

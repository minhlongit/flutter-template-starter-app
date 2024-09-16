// Exception class for cases when there's no Internet connection.
class NoInternetConnectionException implements Exception {
  // Initialize an instance of NoInternetConnectionException.
  const NoInternetConnectionException() : super();
}

// Exception class for cases when the server returns a 500 error (Internal Server Error).
class InternalServerErrorException implements Exception {
  // Detailed description of the error, can be provided during initialization.
  String description;
  // Initialize an instance with an error description, defaulting to an empty string.
  InternalServerErrorException({this.description = ""}) : super();
}

// Exception class for cases when a request is made to a non-existent endpoint, resulting in a 404 error.
class NotFoundEndPointException implements Exception {
  // Initialize an instance of NotFoundEndPointException.
  const NotFoundEndPointException() : super();
}

// Exception class for cases of invalid requests, resulting in a 400 error (Bad Request).
class BadRequestException implements Exception {
  // Detailed description of the error, required to be provided during initialization.
  String description;
  // Initialize an instance with the error description.
  BadRequestException(this.description) : super();
}

import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:starterapp/constants/repository_constants/api_constants/routes/api_route_constants.dart';
import 'package:starterapp/exceptions/api/api_exceptions.dart';
import 'package:starterapp/exceptions/auth/auth_exception.dart';
import 'package:starterapp/helper/api/api_route_helper.dart';
import 'package:starterapp/helper/auth/jwt_token_helper.dart';

class ApiBaseCore {
  late Dio
      baseAPI; // Đối tượng Dio sẽ được khởi tạo để quản lý các yêu cầu HTTP.

  final BaseOptions opts = BaseOptions(
    baseUrl:
        ApiRouteHelper.getBaseUrl(), // Thiết lập URL gốc cho các yêu cầu API.
    responseType:
        ResponseType.json, // Định dạng dữ liệu nhận được từ API là JSON.
    connectTimeout:
        const Duration(seconds: 10), // Thời gian chờ kết nối tối đa là 10 giây.
    receiveTimeout: const Duration(
        seconds: 10), // Thời gian chờ nhận dữ liệu tối đa là 10 giây.
  );

  Dio createDio() {
    return Dio(
        opts); // Tạo một đối tượng Dio mới với các tùy chọn (options) đã cấu hình sẵn.
  }

  ApiBaseCore() {
    Dio dio = createDio(); // Tạo một đối tượng Dio mới.
    baseAPI = addInterceptors(
        dio); // Thêm các interceptor để quản lý các yêu cầu và phản hồi HTTP.
  }

  Dio addInterceptors(Dio dio) {
    return dio
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest:
              (RequestOptions options, RequestInterceptorHandler handler) {
            requestInterceptor(options,
                handler); // Interceptor cho phép xử lý trước khi gửi yêu cầu.
          },
          onError: (DioException e, ErrorInterceptorHandler handler) async {
            log("ERROR: $e"); // Ghi log lỗi nếu có lỗi xảy ra trong quá trình yêu cầu.
            handler.next(e); // Chuyển tiếp lỗi để tiếp tục xử lý.
          },
          onResponse: (Response response, ResponseInterceptorHandler handler) {
            handler.next(response); // Chuyển tiếp phản hồi để tiếp tục xử lý.
          },
        ),
      );
  }

  Future<void> requestInterceptor(
      RequestOptions options, RequestInterceptorHandler handler) async {
    String token = "";
    final jwtTokenHelper = JwtTokenHelper();

    // Kiểm tra xem JWT token có tồn tại không.
    if (await jwtTokenHelper.existJwtToken()) {
      // Nếu token không hợp lệ thì kiểm tra và cập nhật lại token.
      if (!await jwtTokenHelper.isValidAccessToken()) {
        if (!await jwtTokenHelper.isValidRefreshToken()) {
          throw const RefreshTokenExpiredException(); // Nếu refresh token hết hạn, ném ra ngoại lệ.
        }
        Dio dio = Dio(opts);
        Response<dynamic> response = await dio.post(
          ApiRouteConstants.refreshTokenPath,
          data: {
            "refresh": await jwtTokenHelper.getRefreshToken(),
          },
        ).onError(
          (DioException error, stackTrace) => handleError(
              error), // Xử lý lỗi nếu có trong quá trình làm mới token.
        );
        await jwtTokenHelper.saveNewJwtTokens(
          response.data["access"], // Lưu lại access token mới.
          response.data["refresh"], // Lưu lại refresh token mới.
        );
        log("New access token: ${response.data["access"]}"); // Ghi log access token mới.
        log("New refresh token: ${response.data["refresh"]}"); // Ghi log refresh token mới.
        token = response.data["access"];
      }
      token = await jwtTokenHelper
          .getAccessToken(); // Lấy access token để sử dụng cho yêu cầu.
      options.headers.addAll({
        "Authorization": "Bearer $token"
      }); // Thêm token vào header của yêu cầu.
    }
    log("____________________");
    log("URL: ${options.baseUrl}${options.path}"); // Ghi log URL của yêu cầu.
    log("METHOD: ${options.method}"); // Ghi log phương thức HTTP của yêu cầu.
    log("Headers: ${options.headers}"); // Ghi log các header của yêu cầu.
    log("Data: ${options.data}"); // Ghi log dữ liệu (body) của yêu cầu.
    log("QueryParams: ${options.queryParameters}"); // Ghi log các tham số query của yêu cầu.
    log("____________________");
    handler.next(
        options); // Tiếp tục xử lý yêu cầu sau khi đã thêm các thông tin cần thiết.
  }

  // Các phương thức HTTP được định nghĩa để gửi yêu cầu GET, POST, PUT, DELETE.
  Future<Response?> getHTTP(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      Response response = await baseAPI.get(path,
          queryParameters: queryParameters); // Gửi yêu cầu GET.
      return response;
    } on DioException catch (e) {
      handleError(e); // Xử lý lỗi nếu có trong quá trình gửi yêu cầu.
    }
    return null;
  }

  Future<Response?> postHTTP(String path, dynamic data,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      Response response = await baseAPI.post(path,
          data: data, queryParameters: queryParameters); // Gửi yêu cầu POST.
      return response;
    } on DioException catch (e) {
      handleError(e); // Xử lý lỗi nếu có trong quá trình gửi yêu cầu.
    }
    return null;
  }

  Future<Response?> putHTTP(String path, dynamic data,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      Response response = await baseAPI.put(path,
          data: data, queryParameters: queryParameters); // Gửi yêu cầu PUT.
      return response;
    } on DioException catch (e) {
      handleError(e); // Xử lý lỗi nếu có trong quá trình gửi yêu cầu.
    }
    return null;
  }

  Future<Response?> deleteHTTP(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      Response response = await baseAPI.delete(path,
          queryParameters: queryParameters); // Gửi yêu cầu DELETE.
      return response;
    } on DioException catch (e) {
      handleError(e); // Xử lý lỗi nếu có trong quá trình gửi yêu cầu.
    }
    return null;
  }

  // Phương thức xử lý lỗi dựa trên loại lỗi được trả về từ Dio.
  handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        throw const NoInternetConnectionException(); // Ném ngoại lệ khi không có kết nối Internet.
      case DioExceptionType.sendTimeout:
        throw const NoInternetConnectionException(); // Ném ngoại lệ khi yêu cầu gửi bị timeout.
      case DioExceptionType.receiveTimeout:
        throw const NoInternetConnectionException(); // Ném ngoại lệ khi yêu cầu nhận bị timeout.
      case DioExceptionType.badResponse:
        if (error.response == null) {
          throw BadRequestException(
              ""); // Ném ngoại lệ khi không nhận được phản hồi từ server.
        }
        switch (error.response?.statusCode) {
          case 401:
            throw const UnauthorizedException(); // Ném ngoại lệ khi không được ủy quyền (Unauthorized).
          case 400:
            throw BadRequestException(
                ""); // Ném ngoại lệ khi yêu cầu không hợp lệ (Bad Request).
          case 404:
            throw const NotFoundEndPointException(); // Ném ngoại lệ khi không tìm thấy endpoint.
          case 500:
            throw InternalServerErrorException(); // Ném ngoại lệ khi server gặp lỗi.
        }
        break;
      case DioExceptionType.cancel:
        break;
      default:
        throw BadRequestException(
            "Unknown error"); // Ném ngoại lệ khi gặp lỗi không xác định.
    }
  }
}

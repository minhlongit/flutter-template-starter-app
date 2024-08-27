import 'package:flutter/material.dart';
import 'package:starterapp/pages/error/no_internet_page.dart';
import 'package:starterapp/pages/landing_page.dart';
import 'package:starterapp/pages/splash_page.dart';
import 'package:starterapp/pages/undefinited_page.dart';
import 'package:starterapp/routes/routes_constants.dart';

// Hàm `generateRoute` được sử dụng để tạo và quản lý các route (đường dẫn) trong ứng dụng.
Route<dynamic> generateRoute(RouteSettings settings) {
  // Sử dụng cấu trúc switch-case để kiểm tra tên của route (đường dẫn) dựa trên giá trị `settings.name`.
  switch (settings.name) {
    // Khi `settings.name` là `RoutesConstants.splashScreenRoute`, chuyển hướng đến `SplashPage`.
    case RoutesConstants.splashScreenRoute:
      return MaterialPageRoute(
        settings: settings, // Truyền thông tin cài đặt của route vào.
        builder: (context) =>
            const SplashPage(), // Xây dựng giao diện cho `SplashPage`.
      );

    // Khi `settings.name` là `RoutesConstants.landingRoute`, chuyển hướng đến `LandingPage`.
    case RoutesConstants.landingRoute:
      return MaterialPageRoute(
        settings: settings, // Truyền thông tin cài đặt của route vào.
        builder: (context) =>
            const LandingPage(), // Xây dựng giao diện cho `LandingPage`.
      );

    // Khi `settings.name` là `RoutesConstants.noInternetRoute`, chuyển hướng đến `NoInternetPage`.
    case RoutesConstants.noInternetRoute:
      return MaterialPageRoute(
        settings: settings, // Truyền thông tin cài đặt của route vào.
        builder: (context) =>
            const NoInternetPage(), // Xây dựng giao diện cho `NoInternetPage`.
      );

    // Mặc định, nếu `settings.name` không khớp với bất kỳ route nào ở trên, chuyển hướng đến `UndefinitedPage`.
    default:
      return MaterialPageRoute(
        settings: settings, // Truyền thông tin cài đặt của route vào.
        builder: (context) => UndefinitedPage(name: settings.name),
        // Xây dựng giao diện cho `UndefinitedPage` và truyền tên route không xác định.
      );
  }
}

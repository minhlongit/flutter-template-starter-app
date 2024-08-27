import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:starter_app/services/locale_service_provider.dart';
import 'package:flutter/material.dart';
import 'package:starter_app/starter_app.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Đảm bảo các ràng buộc của Flutter được khởi tạo trước khi chạy ứng dụng.

  // Đặt ứng dụng chỉ hoạt động ở chế độ dọc (portrait).
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );

  runApp(
    MultiProvider(
      providers: [
        // Thêm các providers vào đây
        ChangeNotifierProvider(
          create: (context) => LocaleServiceProvider(),
          // Cung cấp một instance của LocaleServiceProvider cho toàn bộ ứng dụng.
          // LocaleServiceProvider sẽ quản lý và thông báo về thay đổi ngôn ngữ trong ứng dụng.
        ),
      ],
      child:
          const StarterApp(), // Khởi chạy ứng dụng với widget gốc là starter_app.
    ),
  );
}

import 'package:provider/provider.dart';
import 'package:starterapp/l10n/l10n.dart';
import 'package:starterapp/routes/routes_constants.dart';
import 'package:starterapp/services/locale_service_provider.dart';
import 'package:starterapp/themes/themes.dart';
import 'routes/router.dart' as router;
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class StarterApp extends StatelessWidget {
  const StarterApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Sử dụng Consumer để lắng nghe và phản hồi các thay đổi từ LocaleServiceProvider
    return Consumer<LocaleServiceProvider>(
      builder: (context, provider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner:
              false, // Tắt hiển thị banner "debug" ở góc trên bên phải.
          title: 'starterapp', // Đặt tiêu đề cho ứng dụng.
          theme: lightTheme, // Áp dụng giao diện sáng cho ứng dụng.
          initialRoute: RoutesConstants
              .splashScreenRoute, // Đặt route ban đầu là màn hình splash.

          // Cung cấp các delegates cho việc nội địa hóa (localization) trong ứng dụng.
          localizationsDelegates: AppLocalizations.localizationsDelegates,

          // Định nghĩa các ngôn ngữ được hỗ trợ trong ứng dụng.
          supportedLocales: L10n.allLanguagesSupported,

          // Tạo ra các route (đường dẫn) dựa trên tên route được yêu cầu.
          onGenerateRoute: router.generateRoute,
        );
      },
    );
  }
}

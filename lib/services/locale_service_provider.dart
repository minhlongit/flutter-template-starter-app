import 'package:flutter/material.dart';
import 'package:starter_app/l10n/l10n.dart';
import 'package:starter_app/repository/local_storage/settings/preferences_local_storage.dart';

// Lớp `LocaleServiceProvider` được sử dụng để quản lý và cập nhật ngôn ngữ (Locale) cho ứng dụng.
// Lớp này kế thừa từ `ChangeNotifier`, giúp thông báo các widget liên quan khi có sự thay đổi về ngôn ngữ.
class LocaleServiceProvider with ChangeNotifier {
  Locale? _locale; // Biến `_locale` lưu trữ thông tin về ngôn ngữ hiện tại.
  Locale? get locale => _locale; // Getter để lấy ngôn ngữ hiện tại.

  // Đối tượng `PreferenceLocalStorage` dùng để tương tác với bộ nhớ cục bộ,
  // nơi lưu trữ thông tin về tùy chọn ngôn ngữ của người dùng.
  PreferenceLocalStorage preferenceLocalStorage = PreferenceLocalStorage();

  // Phương thức `initLocale` dùng để khởi tạo ngôn ngữ cho ứng dụng.
  // Nếu người dùng đã có thiết lập ngôn ngữ trước đó, phương thức sẽ lấy ngôn ngữ đó từ bộ nhớ cục bộ.
  // Nếu không, ngôn ngữ mặc định (languageCode) sẽ được sử dụng.
  Future<void> initLocale(String languageCode) async {
    if (await preferenceLocalStorage.isSetLanguagePreferences()) {
      String languageCode = await preferenceLocalStorage
          .getLanguagePreferences(); // Lấy mã ngôn ngữ từ bộ nhớ cục bộ.
      if (languageCode.isNotEmpty) {
        setLocale(Locale(
            languageCode)); // Thiết lập ngôn ngữ dựa trên mã ngôn ngữ lấy được.
      }
      return;
    }
    _locale = Locale(
        languageCode); // Nếu không có mã ngôn ngữ trước đó, sử dụng ngôn ngữ mặc định.
  }

  // Phương thức `setLocale` dùng để thiết lập và lưu trữ ngôn ngữ mới cho ứng dụng.
  // Nó cũng thông báo cho các widget liên quan về sự thay đổi ngôn ngữ để chúng cập nhật giao diện.
  void setLocale(Locale loc) async {
    await preferenceLocalStorage.setLanguagePreferences(
        loc.languageCode); // Lưu mã ngôn ngữ vào bộ nhớ cục bộ.

    if (!L10n.allLanguagesSupported.contains(loc)) {
      return; // Kiểm tra xem ngôn ngữ có được hỗ trợ hay không.
    }

    _locale = loc; // Cập nhật ngôn ngữ hiện tại.
    notifyListeners(); // Thông báo cho các widget liên quan về sự thay đổi.
  }

  // Phương thức `clearLocale` dùng để xóa thiết lập ngôn ngữ hiện tại,
  // đưa ứng dụng về trạng thái không có ngôn ngữ cụ thể.
  void clearLocale() {
    _locale = null; // Đặt lại `_locale` về null.
    notifyListeners(); // Thông báo cho các widget liên quan về sự thay đổi.
  }
}

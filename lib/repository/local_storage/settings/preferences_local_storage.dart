import 'package:starterapp/repository/local_storage/base/local_storage_core.dart';
import 'package:starterapp/constants/repository_constants/local_storage_constants/settings/app_settings_keys.dart';

class PreferenceLocalStorage {
  // Tạo một đối tượng LocalStorageCore để tương tác với bộ nhớ cục bộ.
  LocalStorageCore localStorageCore = LocalStorageCore();

  // Phương thức kiểm tra xem tùy chọn ngôn ngữ đã được thiết lập hay chưa.
  Future<bool> isSetLanguagePreferences() async {
    return await localStorageCore.exist(AppSettingsKeys.languagePreferencesKey);
    // Kiểm tra sự tồn tại của khóa `languagePreferencesKey` trong bộ nhớ cục bộ.
  }

  // Phương thức lấy tùy chọn ngôn ngữ từ bộ nhớ cục bộ.
  Future<String> getLanguagePreferences() async {
    return await localStorageCore.read(AppSettingsKeys.languagePreferencesKey);
    // Đọc và trả về giá trị ngôn ngữ được lưu trữ tương ứng với khóa `languagePreferencesKey`.
  }

  // Phương thức lưu mã ngôn ngữ (ví dụ: "en", "vi") vào bộ nhớ cục bộ.
  Future<void> setLanguagePreferences(String code) async {
    await localStorageCore.save(AppSettingsKeys.languagePreferencesKey, code);
    // Lưu mã ngôn ngữ được truyền vào vào bộ nhớ cục bộ với khóa `languagePreferencesKey`.
  }
}

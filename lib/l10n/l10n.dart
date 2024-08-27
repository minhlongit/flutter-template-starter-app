import 'dart:ui';

class L10n {
  // Tạo một danh sách tĩnh chứa các đối tượng Locale được hỗ trợ bởi ứng dụng.
  // Mỗi đối tượng Locale đại diện cho một ngôn ngữ (và tùy chọn, một quốc gia) mà ứng dụng có thể được dịch sang.
  // Hiện tại, chỉ có ngôn ngữ Tiếng Anh ('en') được thêm vào danh sách này.
  static final allLanguagesSupported = [
    const Locale(
        'en'), // Thêm Locale 'en' để chỉ định rằng Tiếng Anh được hỗ trợ.
    const Locale(
        'vi'), // Thêm Locale 'vi' để chỉ định rằng Tiếng Việt được hỗ trợ.
    const Locale(
        'ja'), // Thêm Locale 'ja' để chỉ định rằng Tiếng Nhật được hỗ trợ.
  ];
}

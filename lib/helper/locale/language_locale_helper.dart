class LanguageLocalHelper {
  static final Map<String, Map<String, String>> isoLangs = {
    "ja": {"name": "Japan", "nativeName": "Japan"},
    "vi": {"name": "Vietnamese", "nativeName": "Vietnamese"},
    "en": {"name": "English", "nativeName": "English"},
  };

  // Phương thức trả về map các ngôn ngữ.
  Map<String, Map<String, String>> getIsoLangs() => isoLangs;

  // Lấy thông tin ngôn ngữ dựa trên khóa (mã ngôn ngữ).
  // Nếu khóa tồn tại trong map, trả về thông tin ngôn ngữ.
  // Nếu không, ném ra ngoại lệ với thông báo khóa ngôn ngữ không chính xác.
  getDisplayLanguage(key) {
    if (isoLangs.containsKey(key)) {
      return isoLangs[key];
    } else {
      throw Exception("Language key incorrect");
    }
  }

  // Lấy tên ngôn ngữ bản địa dựa trên mã quốc gia.
  // Sử dụng phương thức getDisplayLanguage để lấy thông tin và trả về tên bản địa.
  getNativeLanguageName(countryCode) {
    return getDisplayLanguage(countryCode)["nativeName"];
  }

  // Lấy tên ngôn ngữ (tiếng Anh) dựa trên mã quốc gia.
  // Sử dụng phương thức getDisplayLanguage để lấy thông tin và trả về tên ngôn ngữ.
  getLanguageName(countryCode) {
    return getDisplayLanguage(countryCode)["name"];
  }
}

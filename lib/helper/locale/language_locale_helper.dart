class LanguageLocalHelper {
  static final Map<String, Map<String, String>> isoLangs = {
    "ja": {"name": "Japan", "nativeName": "Japan"},
    "vi": {"name": "Vietnamese", "nativeName": "Vietnamese"},
    "en": {"name": "English", "nativeName": "English"},
  };

  // Method that returns a map of languages.
  Map<String, Map<String, String>> getIsoLangs() => isoLangs;

  // Get language information based on the key (language code).
  // If the key exists in the map, return the language information.
  // If not, throw an exception with the message "Language key incorrect."
  getDisplayLanguage(key) {
    if (isoLangs.containsKey(key)) {
      return isoLangs[key];
    } else {
      throw Exception("Language key incorrect");
    }
  }

  // Get the native language name based on the country code.
  // Uses the getDisplayLanguage method to retrieve the information and return the native name.
  getNativeLanguageName(countryCode) {
    return getDisplayLanguage(countryCode)["nativeName"];
  }

  // Get the language name (in English) based on the country code.
  // Uses the getDisplayLanguage method to retrieve the information and return the language name.
  getLanguageName(countryCode) {
    return getDisplayLanguage(countryCode)["name"];
  }
}

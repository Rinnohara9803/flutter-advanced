enum LanguageType {
  english,
  nepali,
}

const String lEnglish = 'en';
const String lNepali = 'np';

extension LanguageTypeExtension on LanguageType {
  String getValue() {
    switch (this) {
      case LanguageType.english:
        return lEnglish;
      case LanguageType.nepali:
        return lNepali;
    }
  }
}

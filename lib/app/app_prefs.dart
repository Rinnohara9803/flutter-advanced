import 'package:flutteradvanced/presentation/resources/language_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String languageKey = 'key_lang';

class AppPreferences {
  SharedPreferences sharedPreferences;
  AppPreferences(this.sharedPreferences);

  Future<String> getAppLanguage() async {
    String? language = sharedPreferences.getString(languageKey);
    if (language != null && language.isNotEmpty) {
      return language;
    }
    return LanguageType.english.getValue();
  }
}

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_font_weights.dart';



abstract class ILangCache {
  Future<bool> changeLang({required String langCode});
  Future<String> getSavedLang();
}

class LangCacheImpl implements ILangCache {
  final SharedPreferences sharedPreferences;

  LangCacheImpl({required this.sharedPreferences});
  @override
  Future<bool> changeLang({required String langCode}) async =>
      await sharedPreferences.setString(AppStrings.locale, langCode);

  @override
  Future<String> getSavedLang() async =>
      sharedPreferences.containsKey(AppStrings.locale)
          ? sharedPreferences.getString(AppStrings.locale)!
          : AppStrings.arabicABRV;
}
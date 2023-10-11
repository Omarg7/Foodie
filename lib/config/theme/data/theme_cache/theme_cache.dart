import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/utils/app_strings.dart';


abstract class IThemeCache {
  Future<bool> changeTheme({required String theme});
  Future<String> getSavedTheme();
}

class ThemeCacheImpl implements IThemeCache {
  final SharedPreferences sharedPreferences;

  ThemeCacheImpl({required this.sharedPreferences});

  @override
  Future<bool> changeTheme({required String theme}) async =>
      await sharedPreferences.setString(AppStrings.theme, theme);

  @override
  Future<String> getSavedTheme() async =>
      sharedPreferences.containsKey(AppStrings.theme)
          ? sharedPreferences.getString(AppStrings.theme)!
          : AppStrings.arabicABRV;
}
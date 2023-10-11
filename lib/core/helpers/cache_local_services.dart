import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> putData({
    required String key,
    required String value,
  }) async {
    return await sharedPreferences!.setString(key, value);
  }
  static Future<bool> putBool({
    required String key,
    required bool value,
  }) async {
    return await sharedPreferences!.setBool(key, value);
  }
  static String? getData({
    required String key,
  }) {
    return sharedPreferences!.getString(key);
  }
  static bool? getBool({
    required String key,
  }) {
    return sharedPreferences!.getBool(key);
  }
  static Future<bool> isChecked({
    required String key,
    required bool value,
  }) async {
    return await sharedPreferences!.setBool(key, value);
  }

  static bool? getChecked({
    required String key,
  }) {
    return sharedPreferences!.getBool(key);
  }

  static Future<bool> LogOut({
    required String key,
  }) async {
    return await sharedPreferences!.remove(key);
  }

  static Future<bool> savePhone({
    required String key,
    required String value,
  }) async {
    return await sharedPreferences!.setString(key, value);
  }

  static String? getPhone({
    required String key,
  }) {
    return sharedPreferences!.getString(key);
  }
  static Future<bool>? remove({
    required String key,
  }) async{
    return await sharedPreferences!.remove(key);
  }
}

import 'package:flutter/material.dart';
import 'package:cooking_recipes/config/localization/locale/app_localization.dart';

import 'package:flutter/services.dart';
import 'dart:convert' show json;
import 'app_localization_delegate.dart';
export 'package:cooking_recipes/core/utils/app_strings.dart';
class AppLocalizations {
  final Locale locale;
  AppLocalizations(this.locale);
  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
  AppLocalizationsDelegate();
  late Map<String, String> _localizedStrings;
  Future<void> load() async {
    String jsonString =
    await rootBundle.loadString('lang/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    _localizedStrings = jsonMap.map<String, String>((key, value) {
      return MapEntry(key, value.toString());
    });
  }

  String translate(String key) => _localizedStrings[key]??AppStrings.emptyString;
  bool get isEnLocale => locale.languageCode == AppStrings.englishABRV;
}
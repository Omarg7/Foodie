import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cooking_recipes/config/localization/locale/app_localization.dart';

import '../../../../../core/use_case/base_use_case.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../domain/use_case/change_lang_use_case.dart';
import '../../domain/use_case/get_lang_use_case.dart';

part 'localization_state.dart';

class LocalizationCubit extends Cubit<LocalizationState> {
  LocalizationCubit({required this.getSavedLangUseCase, required this.changeLangUseCase}) : super(const LocalizationChanged(Locale(AppStrings.englishABRV)));
  final GetSavedLangUseCase getSavedLangUseCase;
  final ChangeLangUseCase changeLangUseCase;



  String currentLangCode = AppStrings.englishABRV;

  void getSavedLang() async {
    final response = await getSavedLangUseCase.call(const NoParameters());
    response.fold((failure) => emit(const LocalizationChanged(Locale(AppStrings.englishABRV))), (value) {
      currentLangCode = value;
      emit(LocalizationChanged(Locale(currentLangCode)));
    });
  }

  Future<void> _changeLang(String langCode) async {

    final response = await changeLangUseCase.call(langCode);
    response.fold((failure) => debugPrint('cacheFailure'), (value) {
      currentLangCode = langCode;
      emit(LocalizationChanged(Locale(currentLangCode)));
    });
  }
  static LocalizationCubit get(context)=>BlocProvider.of(context);
  void toEnglish(bool currentLang) =>!currentLang? _changeLang(AppStrings.englishABRV):{};

  void toArabic(bool currentLang) =>!currentLang? _changeLang(AppStrings.arabicABRV):{

  };
}

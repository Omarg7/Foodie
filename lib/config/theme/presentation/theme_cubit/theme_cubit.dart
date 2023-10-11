import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../../core/use_case/base_use_case.dart';
import '../../../../core/utils/app_strings.dart';
import '../../app_theme/app_theme_dark.dart';
import '../../app_theme/app_theme_light.dart';
import '../../domain/use_case/change_theme_use_case.dart';
import '../../domain/use_case/get_theme_use_case.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeModeChanged> {
  ThemeCubit(this.getSavedThemeUseCase,this.changeThemeUseCase) : super(ThemeModeChanged(userTheme: LightAppTheme.lightTheme));
  bool _isDark= false;
  bool get isDark =>_isDark;
  static ThemeCubit get(context)=>BlocProvider.of(context);
  String currentTheme = AppStrings.theme;
  final GetSavedThemeUseCase getSavedThemeUseCase;
  final ChangeThemeUseCase changeThemeUseCase;
  void getSavedTheme() async {
    final response = await getSavedThemeUseCase.call(const NoParameters());
    response.fold((failure) {
      currentTheme = AppStrings.lightTheme;

    }, (value) {
      currentTheme = value;

    });
    _checkTheme(currentTheme);
  }

  Future<void> _changeTheme(String theme) async {

    final response = await changeThemeUseCase.call(theme);
    response.fold((failure) {
      currentTheme = AppStrings.lightTheme;
    } , (value) {
      currentTheme = theme;

    });
    _checkTheme( theme);
  }

  void toDarkMode() => _changeTheme(AppStrings.darkTheme);

  void toLightMode() => _changeTheme(AppStrings.lightTheme);
  _checkTheme(String theme){
    if (currentTheme == AppStrings.darkTheme) {
      _isDark=true;
      emit(ThemeModeChanged(userTheme: DarkAppTheme.darkTheme));
    } else {
      _isDark=false;
      emit(ThemeModeChanged(userTheme: LightAppTheme.lightTheme));
    }
  }


}

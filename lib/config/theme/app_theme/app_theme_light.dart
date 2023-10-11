import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_font_weights.dart';
import '../../../core/utils/utils.dart';
import '../app_color/app_color.dart';
import '../app_color/app_color_dark.dart';
import '../app_color/app_color_light.dart';

class LightAppTheme {
  static final ThemeData lightTheme = ThemeData().copyWith(
    appBarTheme: const AppBarTheme(
      color: AppColors.bgColor,
      titleTextStyle: CustomTextStyle.lightAppBarTitle,
      foregroundColor: AppColors.appBarIconColor,
      elevation: 0,
      iconTheme: CustomIconStyle.appBarIconThemeData,
      actionsIconTheme: CustomIconStyle.appBarIconThemeData,
    ),

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      elevation: 2,
      backgroundColor: LightAppColors.lightIconColor,
      focusElevation: 5,
    ),
    radioTheme: const RadioThemeData(
        fillColor: MaterialStatePropertyAll(LightAppColors.lightPrimaryColor)),
    colorScheme: const ColorScheme.light().copyWith(secondary: LightAppColors.lightSecondaryColor,
        surface:LightAppColors.lightAccentColor,
        background: AppColors.bgColor,
        primary: LightAppColors.lightPrimaryColor),
    backgroundColor: AppColors.bgColor,
    switchTheme: SwitchThemeData(

      trackColor: MaterialStateProperty.resolveWith((states) {
        // If the button is pressed, return green, otherwise blue
        if (states.contains(MaterialState.pressed)) {
          return Color(0xFFFF5656);
        }
        return Color(0xFFFF5656);
      }),
      thumbColor: MaterialStateProperty.resolveWith((states) {
        // If the button is pressed, return green, otherwise blue
        if (states.contains(MaterialState.pressed)) {
          return  LightAppColors.lightPrimaryColor;
        }
        return LightAppColors.lightPrimaryColor;
      }),
    ),

    listTileTheme: const ListTileThemeData(
        tileColor: AppColors.bgColor,
        selectedTileColor: LightAppColors.lightPrimaryColor,
        selectedColor: AppColors.bgColor,
        titleAlignment: ListTileTitleAlignment.titleHeight,
        titleTextStyle: TextStyle(
            color: LightAppColors.lightMainTextColor,
            fontSize: AppSizes.fontSize18,
            fontWeight: FontW.semiBold)),
    cardColor: LightAppColors.lightItemCardColor,
    popupMenuTheme: const PopupMenuThemeData(
        color: LightAppColors.lightBackgroundColor,
        textStyle: TextStyle(
          color: LightAppColors.lightTextColor,
        )),
    splashColor: AppColors.white,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      unselectedIconTheme:
          IconThemeData(color: LightAppColors.lightSubTextColor),
      selectedIconTheme: IconThemeData(color: LightAppColors.lightAccentColor),
      type: BottomNavigationBarType.shifting,
      elevation: 5,
      unselectedItemColor: LightAppColors.lightSubTextColor,
      selectedItemColor: LightAppColors.lightAccentColor,
      showUnselectedLabels: true,
      showSelectedLabels: true,
    ),
    scaffoldBackgroundColor: LightAppColors.lightBackgroundColor,
    tabBarTheme: const TabBarTheme(
        unselectedLabelColor: LightAppColors.lightSubTextColor,
        labelColor: LightAppColors.lightPrimaryColor),
    dialogTheme: DialogTheme(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.radius15),
        ),
        backgroundColor: LightAppColors.lightItemCardColor),
    cardTheme: CardTheme(
      margin: const EdgeInsets.all(AppSizes.paddingSize10),
      elevation: AppSizes.size4,
      color: LightAppColors.lightCardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.radius5),
      ),
    ),
    primaryColor: LightAppColors.lightPrimaryColor,
    disabledColor: LightAppColors.lightInActiveButtonColor,
    dividerColor: LightAppColors.lightTextFieldIconColor,
    chipTheme: ChipThemeData(
      labelStyle: const TextStyle(color: Color(0xFF0D8AFF)),
      backgroundColor: LightAppColors.lightSecondaryColor,
      selectedColor: LightAppColors.lightPrimaryColor,
      elevation: 0,
      padding: const EdgeInsets.all(AppSizes.paddingSize2),
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: LightAppColors.lightPrimaryColor),
        borderRadius: BorderRadius.circular(AppSizes.radius10),
      ),
    ),
    buttonTheme: const ButtonThemeData(
      shape: StadiumBorder(),
      buttonColor: LightAppColors.lightPrimaryColor,
      disabledColor: LightAppColors.lightInActiveButtonColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        maximumSize: const Size(400, 45),
        backgroundColor: LightAppColors.lightPrimaryColor,
        minimumSize: const Size(300, 45),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.radius15),
        ),
        elevation: AppSizes.buttonElevation4,
        textStyle: const TextStyle(
          fontSize: AppSizes.fontSize16,
          color: LightAppColors.lightMainButtonTextColor,
          fontWeight: FontW.regular,
        ),
      ),
    ),
      textTheme: const TextTheme().copyWith(
      displayLarge: const TextStyle(inherit:true ,
          color: LightAppColors.lightTextColor,
          fontSize: AppSizes.fontSize32,
          fontWeight: FontW.bold),
      displayMedium: const TextStyle(inherit:true ,
          color: LightAppColors.lightTextColor,
          fontSize: AppSizes.fontSize22,
          fontWeight: FontW.bold),
      displaySmall: const TextStyle(inherit:true ,
          color: LightAppColors.lightTextColor,
          fontSize: AppSizes.fontSize18,
          fontWeight: FontW.semiBold),
      headlineMedium: const TextStyle(inherit:true ,
          color: LightAppColors.lightTextColor,
          fontSize: AppSizes.fontSize20,
          fontWeight: FontW.semiBold),
      headlineSmall: const TextStyle(inherit:true ,
          color: LightAppColors.lightTextColor,
          fontSize: AppSizes.fontSize16,
          fontWeight: FontW.semiBold),


      bodyLarge: const TextStyle(inherit:true ,
          color: LightAppColors.lightPrimaryColor,
          fontSize: AppSizes.fontSize16,
          fontWeight: FontW.semiBold),
      bodyMedium: const TextStyle(inherit:true ,
          color: LightAppColors.lightPrimaryColor,
          fontSize: AppSizes.fontSize14,
          fontWeight: FontW.semiBold),
      bodySmall: const TextStyle(inherit:true ,
          color: LightAppColors.lightPrimaryColor,
          fontSize: AppSizes.fontSize14,
          fontWeight: FontW.semiBold),
    ),
    iconTheme: const IconThemeData(color: LightAppColors.lightIconColor),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.only(
          top: AppSizes.paddingSize4,
          right: AppSizes.paddingSize10,
          bottom: AppSizes.paddingSize4,
          left: AppSizes.paddingSize4),
      filled: true,
      fillColor: LightAppColors.lightTextFieldFilledColor,
      iconColor: LightAppColors.lightTextFieldIconColor,
      prefixStyle: const TextStyle(
        color: LightAppColors.lightTextFieldHintColor,
        fontSize: AppSizes.fontSize14,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.radius10),
        borderSide: const BorderSide(
            color: LightAppColors.lightFocusedTextFieldBorderColor),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.radius10),
        borderSide: const BorderSide(color: DarkAppColors.darkSubTextColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.radius10),
        borderSide: const BorderSide(color: DarkAppColors.darkSubTextColor),
      ),
      hintStyle: const TextStyle(
        color: LightAppColors.lightTextFieldHintColor,
        fontSize: AppSizes.fontSize14,
      ),
      suffixIconColor: LightAppColors.lightTextFieldIconColor,
    ),
  );
}

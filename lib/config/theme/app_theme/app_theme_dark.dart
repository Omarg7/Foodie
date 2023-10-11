import 'package:flutter/material.dart';

import '../../../core/utils/app_font_weights.dart';
import '../../../core/utils/utils.dart';
import '../app_color/app_color.dart';
import '../app_color/app_color_dark.dart';
import '../app_color/app_color_light.dart';

class DarkAppTheme{
  static final ThemeData darkTheme = ThemeData().copyWith(appBarTheme: const AppBarTheme(color:  DarkAppColors.darkBackgroundColor,
    titleTextStyle: CustomTextStyle.darkAppBarTitle,
    foregroundColor: AppColors.appBarIconColor,
    elevation: 0,
    iconTheme: CustomIconStyle.appBarIconThemeData,actionsIconTheme: CustomIconStyle.appBarIconThemeData,
    centerTitle: true,
  ),
floatingActionButtonTheme: const FloatingActionButtonThemeData(elevation: 2,backgroundColor: DarkAppColors.darkPrimaryColor,focusElevation: 5,),
    colorScheme: const ColorScheme.light().copyWith(secondary: DarkAppColors.darkSecondaryColor,
        surface:DarkAppColors.darkAccentColor,
        background: DarkAppColors.darkBackgroundColor,
        primary: DarkAppColors.darkPrimaryColor,),
    splashColor: DarkAppColors.darkItemCardColor,
    cardColor: DarkAppColors.darkItemCardColor,
    listTileTheme: const ListTileThemeData(tileColor: DarkAppColors.darkBackgroundColor),
    popupMenuTheme: const PopupMenuThemeData(
        color: AppColors.white,
        textStyle: TextStyle(
          color: DarkAppColors.darkBackgroundColor,
        )),
    dialogBackgroundColor: DarkAppColors.darkItemCardColor,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: true,
      showSelectedLabels: true,
      selectedItemColor: DarkAppColors.darkMainTextColor,
      unselectedItemColor: DarkAppColors.darkSubTextColor,
      unselectedIconTheme: IconThemeData(color: DarkAppColors.darkSubTextColor),
      selectedIconTheme: IconThemeData(color: DarkAppColors.darkMainTextColor),
      backgroundColor: DarkAppColors.darkBackgroundColor,
      elevation: 5,
    ),
    scaffoldBackgroundColor: DarkAppColors.darkBackgroundColor,
    indicatorColor: Colors.deepPurpleAccent,
    tabBarTheme: const TabBarTheme(
        unselectedLabelColor: Colors.grey,
        labelColor: DarkAppColors.darkMainTextColor),
    dialogTheme: DialogTheme(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.radius15),
        ),
        backgroundColor: DarkAppColors.darkItemCardColor),
    chipTheme: ChipThemeData(
      backgroundColor: AppColors.white,
      selectedColor: AppColors.white,
      elevation: 0,
      padding: const EdgeInsets.all(AppSizes.paddingSize2),
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: AppColors.white),
        borderRadius: BorderRadius.circular(AppSizes.radius10),
      ),
    ),
    switchTheme: SwitchThemeData(

      trackColor: MaterialStateProperty.resolveWith((states) {
        // If the button is pressed, return green, otherwise blue
        if (states.contains(MaterialState.pressed)) {
          return const Color(0xFF461111);
        }
        return const Color(0xFF461111);
      }),
      thumbColor: MaterialStateProperty.resolveWith((states) {
        // If the button is pressed, return green, otherwise blue
        if (states.contains(MaterialState.pressed)) {
          return const Color(0xFF3D0000);
        }
        return const Color(0xFF3D0000);
      }),
    ) ,
    cardTheme: CardTheme(
      margin: const EdgeInsets.all(AppSizes.paddingSize10),
      elevation: AppSizes.size4,
      color: DarkAppColors.darkItemCardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.radius5),
      ),

    ),
    dividerColor: DarkAppColors.darkTextFieldIconColor,
    primaryColor: DarkAppColors.darkPrimaryColor,

    disabledColor: DarkAppColors.darkInActiveButtonColor,
    buttonTheme: const ButtonThemeData(
      shape: StadiumBorder(),
      buttonColor: DarkAppColors.darkActiveButtonColor,
      disabledColor: LightAppColors.lightInActiveButtonColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: DarkAppColors.darkBackgroundColor,
        disabledForegroundColor: Colors.white.withOpacity(0.38),
        disabledBackgroundColor: Colors.white.withOpacity(0.12),
        maximumSize: const Size(400, 45),
        minimumSize: const Size(330, 45),
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(AppSizes.radius15),
        ),
        elevation: AppSizes.buttonElevation4,
        textStyle: const TextStyle(
          fontSize: AppSizes.fontSize16,
          color: Colors.black,
          fontWeight: FontW.regular,
        ),
      ),
    ),
    textTheme: const TextTheme().copyWith(
      displayLarge: const TextStyle(inherit:true ,
          color: DarkAppColors.darkMainTextColor,
          fontSize: AppSizes.fontSize32,
          fontWeight: FontW.bold),
      displayMedium: const TextStyle(inherit:true ,
          color: DarkAppColors.darkMainTextColor,
          fontSize: AppSizes.fontSize22,
          fontWeight: FontW.bold),
      displaySmall: const TextStyle(inherit:true ,
          color: DarkAppColors.darkMainTextColor,
          fontSize: AppSizes.fontSize18,
          fontWeight: FontW.bold),

      headlineMedium: const TextStyle(inherit:true ,
          color: DarkAppColors.darkSubTextColor,
          fontSize: AppSizes.fontSize20,
          fontWeight: FontW.regular),
      headlineSmall: const TextStyle(inherit:true ,
          color: DarkAppColors.darkMainTextColor,
          fontSize: AppSizes.fontSize16,
          fontWeight: FontW.semiBold),

      bodyLarge: const TextStyle(inherit:true ,
          color: DarkAppColors.darkMainTextColor,
          fontSize: AppSizes.fontSize16,
          fontWeight: FontW.regular),
      bodyMedium: const TextStyle(inherit:true ,
          color: DarkAppColors.darkSubTextColor,
          fontSize: AppSizes.fontSize14,
          fontWeight: FontW.regular),
      bodySmall: const TextStyle(inherit:true ,
          color: DarkAppColors.darkMainTextColor,
          fontSize: AppSizes.fontSize14,
          fontWeight: FontW.regular),
    ),
    iconTheme: const IconThemeData(color: LightAppColors.lightBackgroundColor),
    inputDecorationTheme: InputDecorationTheme(

      contentPadding: const EdgeInsets.only(
          top: AppSizes.paddingSize4,
          right: AppSizes.paddingSize10,
          bottom: AppSizes.paddingSize4,
          left: AppSizes.paddingSize4),
      filled: true,
      fillColor: DarkAppColors.darkTextFieldFilledColor,
      iconColor: DarkAppColors.darkTextFieldIconColor,
      prefixStyle: const TextStyle(
        color: DarkAppColors.darkTextFieldHintColor,
        fontSize: AppSizes.fontSize14,
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.radius10),
        borderSide:
        const BorderSide(color: DarkAppColors.darkFocusedTextFieldBorderColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.radius10),
        borderSide: const BorderSide(color: DarkAppColors.darkTextFieldFilledColor),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.radius10),
        borderSide: const BorderSide(color: DarkAppColors.darkTextFieldFilledColor),
      ),
      hintStyle: const TextStyle(
        color: LightAppColors.lightTextFieldHintColor,
        fontSize: AppSizes.fontSize14,
      ),
      suffixIconColor: DarkAppColors.darkTextFieldIconColor,
    ),
  );
}
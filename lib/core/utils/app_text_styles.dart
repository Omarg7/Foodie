import 'package:cooking_recipes/config/theme/app_color/app_color_light.dart';
import 'package:flutter/material.dart';

import '../../config/theme/app_color/app_color.dart';
import 'app_sizes.dart';

class CustomTextStyle {
  static const TextStyle  lightAppBarTitle = TextStyle(
      fontSize: AppSizes.fontSize22,color: LightAppColors.lightMainTextColor,fontWeight: FontWeight.w600
  );
  static const TextStyle  darkAppBarTitle = TextStyle(
      fontSize: AppSizes.fontSize22,color: AppColors.black,fontWeight: FontWeight.w600
  );
  static const TextStyle  outlinedFiledError = TextStyle(
      fontSize: AppSizes.fontSize10,
      color: AppColors.red,
      fontWeight: FontWeight.w400
  );
  static const TextStyle  outlinedLabelStyle = TextStyle(
      fontSize: 15.0, color: Colors.purple,
      fontWeight: FontWeight.w600
  );
  static const TextStyle  outlinedTextStyle = TextStyle(
      fontSize: 16.0, color: Colors.purple,
      fontWeight: FontWeight.w600
  );
  static const TextStyle  outlinedLabelErrorStyle = TextStyle(
      fontSize: 14.0, color: AppColors.red,
      fontWeight: FontWeight.w600
  );

  getTextFieldStyle() {
    return const TextStyle(
      fontSize: 12.0,
      color: Colors.black,
    );
  } //textfield style

}
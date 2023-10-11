import 'package:cooking_recipes/config/theme/presentation/theme_cubit/theme_cubit.dart';
import 'package:flutter/material.dart';

import '../utils/app_font_weights.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../config/theme/app_color/app_color.dart';

class Separator extends StatelessWidget {
  const Separator({Key? key, this.height}) : super(key: key);
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Container(height: height??AppSizes.size5,width: MediaQuery.of(context).size.width,color:ThemeCubit.get(context).isDark? AppColors.darkSeparatorColor:AppColors.lightSeparatorColor,
    );
  }
}

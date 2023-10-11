
import 'package:cooking_recipes/config/theme/app_color/app_color.dart';
import 'package:cooking_recipes/config/theme/app_color/app_color.dart';
import 'package:cooking_recipes/config/theme/app_color/app_color.dart';
import 'package:cooking_recipes/config/theme/app_color/app_color.dart';
import 'package:cooking_recipes/config/theme/app_color/app_color.dart';
import 'package:cooking_recipes/config/theme/app_color/app_color_light.dart';
import 'package:cooking_recipes/config/theme/presentation/theme_cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_font_weights.dart';
import '../../../../config/localization/locale/app_localization.dart';
import '../../../../config/theme/app_theme/app_theme_light.dart';
import '../../../../core/utils/app_sizes.dart';


class SettingsTile extends StatelessWidget {
  const SettingsTile(
      {Key? key,
      this.onTap,
        this.mode,
this.logOut,
      required this.title,
      required this.leadingIcon,

      required this.tileColor,
      required this.iconColor,
      required this.iconBGColor})
      : super(key: key);
  final Function()? onTap;
  final String title;
  final IconData leadingIcon;

  final Color tileColor;
  final Color iconColor;
  final Color iconBGColor;
  final bool? mode;
  final bool? logOut;
  @override
  Widget build(BuildContext context) {
    return /*Card(

      margin: const EdgeInsets.symmetric(vertical: AppSizes.marginSize10,horizontal: AppSizes.marginSize10),
      child:*/ Container(margin: const EdgeInsets.symmetric(vertical: AppSizes.marginSize4,horizontal: AppSizes.marginSize10),
        child: InkWell(onTap: onTap,
          child: /*ListTile(minVerticalPadding: AppSizes.size20,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.radius5)),
            tileColor:logOut==true? AppColors.red: ThemeCubit.get(context).isDark? AppColors.darkSeparatorColor:Theme.of(context).listTileTheme.tileColor,
            title: Text(
              AppLocalizations.of(context)!.translate(title) ,
            ),
            leading: Container(decoration:BoxDecoration(color:logOut==true?AppColors.white:Theme.of(context).colorScheme.surface *//*iconBGColor*//* *//*iconBGColor*//*,shape: BoxShape.rectangle,borderRadius: BorderRadius.circular(AppSizes.radius10)),
              width: AppSizes.size40,height:  AppSizes.size40,
              child: Center(
                child: Icon(
                  leadingIcon,
                  color: iconColor,
                ),
              ),
            ),
            trailing:mode==true? BlocBuilder<ThemeCubit,
                ThemeModeChanged>(
              builder: (context, state) {
                return SizedBox(width: AppSizes.size30,
                  child: Switch.adaptive(
                      value: state.userTheme==LightAppTheme.lightTheme,
                      onChanged: (isLight) {

                        isLight
                            ?ThemeCubit.get(context).toLightMode():ThemeCubit.get(context).toDarkMode();



                      }),
                );
              },
            ):logOut==true? const SizedBox():Icon(AppLocalizations.of(context)!.isEnLocale? Icons.arrow_circle_right_outlined:Icons.arrow_circle_left_outlined,color:logOut==true? AppColors.white:AppColors.blueGrey,),




          )*/
          Container(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.paddingSize16,vertical: AppSizes.paddingSize10),
            decoration: BoxDecoration(
              color:logOut==true? AppColors.red: ThemeCubit.get(context).isDark? AppColors.darkSeparatorColor:Colors.grey.shade200,
borderRadius: BorderRadius.circular(AppSizes.size10),
            ),
            margin: const EdgeInsets.symmetric(vertical: AppSizes.marginSize8),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: AppSizes.paddingSize16),
                  child: Container(
                    decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(AppSizes.radius10),
                        color:logOut==true?AppColors.white:Theme.of(context).colorScheme.surface),
                      width: AppSizes.size40,height:  AppSizes.size40,
                    child: Center(
                      child: Icon(
                        leadingIcon,
                        color: iconColor,
                      ),
                    ),
                  ),
                ),

                Expanded(child: Text(
                  AppLocalizations.of(context)!.translate(title) ,
                  style:logOut==true? Theme.of(context).textTheme.displaySmall!.copyWith(color:AppColors.white ):Theme.of(context).textTheme.displaySmall,
                )),
                mode==true? BlocBuilder<ThemeCubit,
                    ThemeModeChanged>(
                  builder: (context, state) {
                    return SizedBox(width: AppSizes.size30,
                      child: Switch.adaptive(
                          value: state.userTheme==LightAppTheme.lightTheme,
                          onChanged: (isLight) {

                            isLight
                                ?ThemeCubit.get(context).toLightMode():ThemeCubit.get(context).toDarkMode();



                          }),
                    );
                  },
                ):logOut==true? const SizedBox():Icon(AppLocalizations.of(context)!.isEnLocale? Icons.arrow_circle_right_outlined:Icons.arrow_circle_left_outlined,color:logOut==true? AppColors.white:AppColors.blueGrey,),
              ],
            ),
          ),
        ),
      )
      /*,)*/;
  }
}

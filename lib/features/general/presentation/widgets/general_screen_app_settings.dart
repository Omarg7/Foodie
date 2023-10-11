import 'package:cooking_recipes/config/theme/presentation/theme_cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_font_weights.dart';
import '../../../../config/localization/locale/app_localization.dart';
import '../../../../config/theme/app_color/app_color.dart';
import '../../../auth/presentation/cubit/auth/auth_cubit.dart';
import '../../../auth/presentation/screens/login_screen.dart';
import '../screens/language_screen.dart';
import 'settings_tile.dart';


class GeneralScreenAppSettings extends StatelessWidget {
  const GeneralScreenAppSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<ThemeCubit, ThemeState>(
  builder: (context, state) {
    return SettingsTile(mode: true,title:AppStrings.theme, leadingIcon:ThemeCubit.get(context).isDark? Icons.dark_mode:Icons.sunny,  tileColor: Theme.of(context).colorScheme.background, iconColor: Theme.of(context).colorScheme.background, iconBGColor: /*Color(0xFF5b7c99)*/Theme.of(context).primaryColor );
  },
),
        // Divider(indent:Sizes.size10 ,endIndent: Sizes.size10,color: CustomColors.grey,height: .5,),
        SettingsTile(onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LocalizationScreen(),));
        },title:AppStrings.language, leadingIcon: Icons.translate,  tileColor: Theme.of(context).colorScheme.background, iconColor: Theme.of(context).colorScheme.background, iconBGColor: /*Color(0xFF5b7c99)*/Theme.of(context).primaryColor ),
     SettingsTile(onTap: (){
          AuthCubit.get(context).saveRememberMeVal(false);
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const LoginScreen(),), (route) => false);
        },logOut: true,title: AppStrings.logout, leadingIcon: Icons.exit_to_app,  tileColor: Theme.of(context).colorScheme.background, iconColor: AppColors.red, iconBGColor:AppColors.white ),

        // ProfileTile(title: TextVar.account, leadingIcon: Icons.person, trialingIcon: Icons.arrow_circle_left_outlined, tileColor: Theme.of(context).colorScheme.background, iconColor: Theme.of(context).colorScheme.background, iconBGColor: Color(0xFF6ECFA9)),
      ],
    );
  }
}

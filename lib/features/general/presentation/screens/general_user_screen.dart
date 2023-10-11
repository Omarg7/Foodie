
import 'package:cooking_recipes/config/theme/presentation/theme_cubit/theme_cubit.dart';
import 'package:cooking_recipes/core/widgets/custom_app_bar.dart';
import 'package:cooking_recipes/features/general/presentation/screens/profile_user_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../../config/theme/app_color/app_color.dart';
import '../../../../core/utils/app_font_weights.dart';
import '../../../../config/localization/locale/app_localization.dart';
import '../../../../core/utils/utils.dart';
import '../../../auth/presentation/cubit/auth/auth_cubit.dart';
import '../../../auth/presentation/screens/edit_profile_screen.dart';
import '../../../auth/presentation/screens/login_screen.dart';
import '../../../auth/presentation/screens/reset_password_screen.dart';
import '../widgets/settings_tile.dart';
import 'language_screen.dart';




class AppSettingsScreen extends StatefulWidget {
  const AppSettingsScreen({Key? key}) : super(key: key);

  @override
  State<AppSettingsScreen> createState() => _AppSettingsScreenState();
}

class _AppSettingsScreenState extends State<AppSettingsScreen> {

  @override
  void initState(){

    super.initState();
  }

  final Color dividerColor=AppColors.grey300;
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<ThemeCubit, ThemeState>(
  builder: (context, state) {
    return Scaffold(
      appBar: CustomAppBar(
        customTitle: AppLocalizations.of(context)!.translate(AppStrings.general), context: context,),
      body:  SingleChildScrollView(
        child: Column(mainAxisSize: MainAxisSize.max,
          children:  [
            const SizedBox(height: AppSizes.size10,),

            SettingsTile(onTap: (){


              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const EditProfileScreen(newUser: false),));

            },title: AppStrings.account, leadingIcon: Icons.person,  tileColor: Theme.of(context).colorScheme.background, iconColor: Theme.of(context).colorScheme.background, iconBGColor:Theme.of(context).primaryColor ),
            // Divider(indent: Sizes.size10,endIndent: Sizes.size10,color: CustomColors.grey,height: .5),
            SettingsTile(onTap: (){

              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  const ResetPasswordScreen(),));

            },title:AppStrings.changePassword, leadingIcon: Icons.password, tileColor: Theme.of(context).colorScheme.background, iconColor: Theme.of(context).colorScheme.background, iconBGColor:Theme.of(context).primaryColor ),

            // Padding(
            //   padding: const EdgeInsets.only(left: Sizes.paddingSize16,right: Sizes.paddingSize16,top: Sizes.paddingSize10),
            //   child: Row(children: [
            //     Text(AppLocalizations.of(context)!.translate(AppStrings.appSettings),style: Theme.of(context).textTheme.subtitle1,),
            //   ],),
            // ),

            BlocBuilder<ThemeCubit, ThemeState>(
              builder: (context, state) {
                return SettingsTile(mode: true,title:AppStrings.theme, leadingIcon:ThemeCubit.get(context).isDark? Icons.dark_mode:Icons.sunny,  tileColor: Theme.of(context).colorScheme.background, iconColor: Theme.of(context).colorScheme.background, iconBGColor: /*Color(0xFF5b7c99)*/Theme.of(context).primaryColor );
              },
            ),
            // Divider(indent:Sizes.size10 ,endIndent: Sizes.size10,color: CustomColors.grey,height: .5,),
            // SettingsTile(onTap: (){
            //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LocalizationScreen(),));
            // },title:AppStrings.language, leadingIcon: Icons.translate,  tileColor: Theme.of(context).colorScheme.background, iconColor: Theme.of(context).colorScheme.background, iconBGColor: /*Color(0xFF5b7c99)*/Theme.of(context).primaryColor ),
            SettingsTile(onTap: ()async{
              await AuthCubit.get(context).signOut();
              if(!mounted) return;
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const LoginScreen(),), (route) => false);
            },logOut: true,title: AppStrings.logout, leadingIcon: Icons.exit_to_app,  tileColor: Theme.of(context).colorScheme.background, iconColor: AppColors.red, iconBGColor:AppColors.white ),

const SizedBox(height: AppSizes.size80,),
          ],
        ),
      ),
    );
  },
);
  }
}

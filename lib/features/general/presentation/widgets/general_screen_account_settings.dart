import 'package:cooking_recipes/features/general/presentation/widgets/settings_tile.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_font_weights.dart';
import '../../../../config/localization/locale/app_localization.dart';
import '../../../auth/presentation/cubit/auth/auth_cubit.dart';
import '../../../auth/presentation/screens/change_password_screen.dart';
import '../../../auth/presentation/screens/reset_password_screen.dart';
import '../screens/profile_user_screen.dart';


class GeneralScreenAccountSettings extends StatelessWidget {
  const GeneralScreenAccountSettings({Key? key}) : super(key: key);
  // final Color dividerColor=CustomColors.grey;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        // Divider(indent: Sizes.size10,endIndent: Sizes.size10,color: CustomColors.grey,height: .5),
        // SettingsTile(title:AppStrings.logout, leadingIcon: Icons.exit_to_app, tileColor: Theme.of(context).colorScheme.background, iconColor: Theme.of(context).colorScheme.background, iconBGColor:Theme.of(context).primaryColor ),
        // Divider(indent: Sizes.size10,endIndent: Sizes.size10,color: CustomColors.grey,height: .5),
        // SettingsTile(deleteAccount: true,title: AppStrings.deleteAcc, leadingIcon: Icons.no_accounts,  tileColor: Theme.of(context).colorScheme.background, iconColor: CustomColors.red, iconBGColor:CustomColors.white ),


      ],
    );
  }
}

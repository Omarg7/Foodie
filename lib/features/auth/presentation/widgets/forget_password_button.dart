import 'package:cooking_recipes/features/auth/presentation/screens/reset_password_screen.dart';
import 'package:flutter/material.dart';

import '../../../../config/localization/locale/app_localization.dart';
import '../screens/change_password_screen.dart';

class ForgetPasswordButton extends StatelessWidget {
  const ForgetPasswordButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: (){
  Navigator.push(context, MaterialPageRoute(builder: (context) => ChangePasswordScreen(),));
    }, child: Text(   AppLocalizations.of(context)!.translate(AppStrings.forgetPassword),
      style: Theme.of(context).textTheme.headlineSmall!.copyWith(decoration: TextDecoration.underline),));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/localization/locale/app_localization.dart';
import '../cubit/auth/auth_cubit.dart';




class RememberMe extends StatefulWidget {
  const RememberMe({Key? key}) : super(key: key);

  @override
  State<RememberMe> createState() => _RememberMeState();
}

class _RememberMeState extends State<RememberMe> {
 late ValueNotifier<bool> _rememberMe;
 @override
 void initState() {
   _rememberMe=ValueNotifier(false);
    super.initState();
  }
 @override
 void dispose() {
   _rememberMe.dispose();
   super.dispose();
 }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ValueListenableBuilder<bool>(builder: (context, value, child) =>
            Checkbox(
                value: value,
                onChanged: (value) {
                  _rememberMe.value=!_rememberMe.value;
                  BlocProvider.of<AuthCubit>(context).saveRememberMeVal(value??false);
                }),valueListenable: _rememberMe,

        ),
        Text(
          AppLocalizations.of(context)!.translate(  AppStrings.rememberCheckBox)    ,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ],
    );
  }
}

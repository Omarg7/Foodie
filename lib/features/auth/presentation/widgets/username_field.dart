import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cooking_recipes/config/localization/locale/app_localization.dart';

import '../../../../core/utils/app_font_weights.dart';
import '../../../../core/widgets/outlined_text_field.dart';
import '../cubit/auth/auth_cubit.dart';



class UsernameField extends StatelessWidget {
  const UsernameField({Key? key, required this.userNameFocusNode, required this.userNameController, this.onEditComplete, required this.fromLogin,this.fromUpdate}) : super(key: key);
  final FocusNode userNameFocusNode;
  final TextEditingController userNameController;
  final Function()? onEditComplete;
  final bool fromLogin;
  final bool? fromUpdate;
  @override
  Widget build(BuildContext context) {
    return OutlineBorderTextFormField(onEditComplete: onEditComplete,prefixIcon: Icons.person_outlined,label:AppLocalizations.of(context)!.translate(AppStrings.username),focusNode: userNameFocusNode,textEditingController: userNameController,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      autofocus: false,
      checkOfErrorOnFocusChange: true,

      validation: (val){

        String? validation=  AuthCubit.get(context).validateUsername(val,fromLogin,fromUpdate);
        return validation!=null? AppLocalizations.of(context)!.translate(validation):null;

      },);
  }
}

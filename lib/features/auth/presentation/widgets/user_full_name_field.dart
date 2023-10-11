import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cooking_recipes/config/localization/locale/app_localization.dart';

import '../../../../core/utils/app_font_weights.dart';
import '../../../../core/widgets/outlined_text_field.dart';
import '../cubit/auth/auth_cubit.dart';

class FullNameField extends StatelessWidget {
  const FullNameField({Key? key, required this.fullNameFocusNode, required this.fullNameController, this.onEditComplete}) : super(key: key);
  final FocusNode fullNameFocusNode;
  final TextEditingController fullNameController;
  final Function()? onEditComplete;
  @override
  Widget build(BuildContext context) {
    return OutlineBorderTextFormField(onEditComplete: onEditComplete,prefixIcon: Icons.person,label:AppLocalizations.of(context)!.translate(AppStrings.fullName),focusNode: fullNameFocusNode,textEditingController: fullNameController,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      autofocus: false,
      checkOfErrorOnFocusChange: true,

      validation: (val){
        String? validation= BlocProvider.of<AuthCubit>(context).validateFullName(val);
        return validation!=null? AppLocalizations.of(context)!.translate(validation):null;

      },);
  }
}

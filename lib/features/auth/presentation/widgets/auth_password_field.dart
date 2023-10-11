import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../../core/utils/app_font_weights.dart';

import '../../../../core/widgets/outlined_text_field.dart';
import 'package:cooking_recipes/config/localization/locale/app_localization.dart';

import '../cubit/auth/auth_cubit.dart';

class AuthPasswordField extends StatefulWidget {
  const AuthPasswordField({Key? key,this.label ,required this.passwordController, required this.passwordFocusNode, this.onEditComplete,}) : super(key: key);
  final TextEditingController passwordController;
  final FocusNode passwordFocusNode;
  final Function()? onEditComplete;
  final String? label;
  @override
  State<AuthPasswordField> createState() => _AuthPasswordFieldState();
}

class _AuthPasswordFieldState extends State<AuthPasswordField> {
  late ValueNotifier<bool> _passwordVis;
  @override
  void initState() {
    _passwordVis=ValueNotifier(true);
    super.initState();
  }
  @override
  void dispose() {
 _passwordVis.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  ValueListenableBuilder<bool>(valueListenable: _passwordVis,builder: (context, value, child) => OutlineBorderTextFormField(
      obscureText: value,suffixIcon: IconButton(onPressed: (){
      _passwordVis.value=!_passwordVis.value;
    }, icon: Icon(value?Icons.visibility:Icons.visibility_off)),
      onEditComplete: widget.onEditComplete,prefixIcon: Icons.password,label:widget.label!=null?  AppLocalizations.of(context)!.translate(widget.label??''):AppLocalizations.of(context)!.translate(AppStrings.passwordText),focusNode: widget.passwordFocusNode,textEditingController: widget.passwordController,
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.next,
      autofocus: false,
      checkOfErrorOnFocusChange: true,

      validation: (val){

        String? validation= AuthCubit.get(context).validatePassword(val);
        return validation!=null? AppLocalizations.of(context)!.translate(validation):null;


      },),

    );
  }
}

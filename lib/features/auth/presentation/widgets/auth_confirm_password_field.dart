import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_font_weights.dart';
import '../../../../core/widgets/outlined_text_field.dart';
import 'package:cooking_recipes/config/localization/locale/app_localization.dart';

class AuthConfirmPasswordField extends StatefulWidget {
  const AuthConfirmPasswordField({Key? key, required this.passwordController, required this.passwordFocusNode, this.onEditComplete,required this.validation}) : super(key: key);
  final TextEditingController passwordController;
  final FocusNode passwordFocusNode;
  final Function()? onEditComplete;
  final Function validation;
  @override
  State<AuthConfirmPasswordField> createState() => _AuthConfirmPasswordFieldState();
}

class _AuthConfirmPasswordFieldState extends State<AuthConfirmPasswordField> {
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
    return  ValueListenableBuilder<bool>(valueListenable: _passwordVis,builder: (context, value, child) =>

        OutlineBorderTextFormField(obscureText: value,suffixIcon: IconButton(onPressed: (){
          _passwordVis.value=!_passwordVis.value;
        }, icon: Icon(value?Icons.visibility:Icons.visibility_off)),
          onEditComplete: widget.onEditComplete,prefixIcon: Icons.password,label:AppLocalizations.of(context)!.translate(AppStrings.confirmPassword)  ,focusNode: widget.passwordFocusNode,textEditingController: widget.passwordController,
          keyboardType: TextInputType.visiblePassword,
          textInputAction: TextInputAction.next,
          autofocus: false,
          checkOfErrorOnFocusChange: true,

          validation:(val){
          return widget.validation();
          },),

    );
  }
}

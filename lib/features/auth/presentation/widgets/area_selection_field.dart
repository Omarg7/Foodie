import 'package:flutter/material.dart';
import 'package:cooking_recipes/config/localization/locale/app_localization.dart';

import '../../../../core/utils/app_font_weights.dart';
import '../../../../core/widgets/outlined_text_field.dart';
import '../screens/areas_screen.dart';
import '../cubit/auth/auth_cubit.dart';



class PreferredCountryField extends StatelessWidget {
  const PreferredCountryField({Key? key, required this.preferredCountryFocusNode, required this.preferredCountryController, this.onEditComplete}) : super(key: key);
  final FocusNode preferredCountryFocusNode;
  final TextEditingController preferredCountryController;
  final Function()? onEditComplete;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context) => SelectAreaScreen(),));
    },
      child: OutlineBorderTextFormField(suffixIcon: Icon(Icons.arrow_drop_down_circle_outlined),
        disabled: true,
        onEditComplete: onEditComplete,prefixIcon: Icons.flag,label:AppLocalizations.of(context)!.translate(AppStrings.countryFood),focusNode: preferredCountryFocusNode,textEditingController: preferredCountryController,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        autofocus: false,
        checkOfErrorOnFocusChange: true,

        validation: (val){
          String? validation=  AuthCubit.get(context).validatePreferredCountry(val);
          return validation!=null? AppLocalizations.of(context)!.translate(validation):null;

        },),
    );
  }
}

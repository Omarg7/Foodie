import 'package:cooking_recipes/config/theme/presentation/theme_cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import '../utils/app_font_weights.dart';
import '../../config/theme/app_color/app_color.dart';
import '../utils/utils.dart';

class OutlineBorderTextFormField extends StatefulWidget {
  FocusNode focusNode;
  TextEditingController textEditingController;
  String label;
  TextInputType keyboardType;
  IconData prefixIcon;
  bool autofocus = false;
  TextInputAction textInputAction;
  List<TextInputFormatter>? inputFormatters;
  Function validation;
  Widget? suffixIcon;
  bool? disabled;
  bool? ignoreValidate;
  Function()? onEditComplete;
  bool? obscureText;
  bool checkOfErrorOnFocusChange = false;//If true validation is checked when evre focus is changed
 Function(String)? onChanged;
  @override
  State<StatefulWidget> createState() => _OutlineBorderTextFormField();


  OutlineBorderTextFormField(
      {super.key,
        this.obscureText=false,
        this.suffixIcon,
        this.ignoreValidate,
        this.disabled,
        required this.onEditComplete,
        required this.prefixIcon,
    required this.focusNode,
        required this.textEditingController,
        required this.label,
        required this.keyboardType,
        required this.autofocus,
        required this.textInputAction,
         this.inputFormatters,
        required this.checkOfErrorOnFocusChange,
        required this.validation,
        this.onChanged,
});

}

class _OutlineBorderTextFormField extends State<OutlineBorderTextFormField> {
  bool isError = false;
  String errorString = "";



  // Error text style

  getBorderColor(isFocus) {
    return isFocus
        ?   ThemeCubit.get(context).isDark ?  AppColors.white:AppColors.black
        : ThemeCubit.get(context).isDark ? Colors.black87:Colors.white70;
  }//Border colors according to focus

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: AppSizes.size600+ AppSizes.size25),
        width: MediaQuery.of(context).size.width * .9 + AppSizes.size25,
decoration: BoxDecoration(borderRadius: BorderRadius.circular(AppSizes.radius50)),
        margin: const EdgeInsets.only(bottom: AppSizes.size10),
        padding: const EdgeInsets.only(left: AppSizes.paddingSize10, top: AppSizes.paddingSize5, right: AppSizes.paddingSize10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FocusScope(
              child: Focus(
                onFocusChange: (focus) {
                 {
                    setState(() {
                      getBorderColor(focus);
                      if (widget.checkOfErrorOnFocusChange &&
                          widget
                              .validation(widget.textEditingController.text)
                              .toString()
                              .isNotEmpty &&
                          widget.validation(
                                  widget.textEditingController.text) !=
                              null) {
                        isError = true;
                        errorString = widget
                            .validation(widget.textEditingController.text);
                      } else {
                        isError = false;
                        errorString = '';
                      }
                    });
                  }
                },
                child: Container(
                  padding:isError? const EdgeInsets.all(AppSizes.size1):const EdgeInsets.all(AppSizes.size2),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.background,
                      borderRadius: const BorderRadius.all(Radius.circular(
                          AppSizes.radius50) //                 <--- border radius here
                      ),
                      border: Border.all(
                        width: 1,
                        style: BorderStyle.solid,
                        color: isError
                            ? Colors.red.shade700
                            : getBorderColor(widget.focusNode.hasFocus),
                      )),
                  child: SizedBox(width: double.maxFinite,
                    child: Theme(data:  Theme.of(context).copyWith(
                      textSelectionTheme: Theme.of(context).textSelectionTheme.copyWith(
                         selectionHandleColor: AppColors.grey
                      )
                    ),
                      child: Material(color:Theme.of(context).colorScheme.background ,
                        borderRadius: BorderRadius.circular(AppSizes.radius50),
                        child: TextFormField(

                          style: Theme.of(context).textTheme.headlineSmall,
                          obscureText: widget.obscureText??false,
                          enabled: widget.disabled==true?false:true,
                          onEditingComplete:widget.onEditComplete ,
                          focusNode: widget.focusNode,
                          controller: widget.textEditingController,
                          onChanged: widget.onChanged,
                          autofocus: widget.autofocus,
                          keyboardType: widget.keyboardType,
                          cursorColor: ThemeCubit.get(context).isDark?AppColors.white:AppColors.black,
                          textInputAction: widget.textInputAction,
                          inputFormatters: widget.inputFormatters,
                          validator:(String? string) {

                            if (widget
                                .validation(widget.textEditingController.text)
                                .toString()
                                .isNotEmpty && widget
                                .validation(widget.textEditingController.text)
                                !=null) {
                              setState(() {
                                isError = true;
                                errorString = widget
                                    .validation(widget.textEditingController.text);
                              });
                              return "";
                            } else {
                              setState(() {
                                isError = false;
                                errorString = ''; });
                            }
                            return null;
                          },
                          decoration: InputDecoration(

                            prefixIcon: Icon(widget.prefixIcon),suffixIcon:widget.suffixIcon,
                              labelText: widget.label,
                              labelStyle: isError
                                  ? CustomTextStyle.outlinedLabelErrorStyle
                                  : CustomTextStyle.outlinedLabelStyle.copyWith(color: AppColors.grey),
                              contentPadding:
                              const EdgeInsets.symmetric(vertical: AppSizes.paddingSize5, horizontal: AppSizes.paddingSize16
                              ),
                              fillColor: Theme.of(context).colorScheme.background,
                              filled: true,
                              enabledBorder: UnderlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(AppSizes.radius50)),
                              errorBorder: UnderlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(AppSizes.radius50)),
                              border: UnderlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(AppSizes.radius50)),
                              errorStyle: const TextStyle(height: 0),
                              focusedErrorBorder: UnderlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(AppSizes.radius50)),
                              disabledBorder: UnderlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(AppSizes.radius50)),
                              focusedBorder: UnderlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(AppSizes.radius50)),
                            prefixIconColor: widget.focusNode.hasFocus? ThemeCubit.get(context).isDark? AppColors.white:AppColors.black:AppColors.grey,
                              ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Visibility(
                visible: isError ? true : false,
                child: Container(
                    padding: const EdgeInsets.only(right: AppSizes.paddingSize14, top: AppSizes.paddingSize2),
                    child: Text(
                      errorString,
                      style: CustomTextStyle.outlinedFiledError,
                    ))),
          ],
        ),
      ),
    );
    ;
  }
}
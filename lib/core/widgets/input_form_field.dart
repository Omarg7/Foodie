import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_font_weights.dart';
import '../../config/theme/app_color/app_color.dart';
import '../../config/theme/app_color/app_color_dark.dart';
import '../../config/theme/app_color/app_color_light.dart';
import '../utils/utils.dart';

class CustomFormField extends StatefulWidget {
  final String hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final int? maxLines;
  final bool? obscureText;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final TextInputType textInputType;
  final TextEditingController textEditingController;
  final Function(String?)? onChanged;
  final Function()? suffixIconOnPressed;
  final Function()? prefixIconOnPressed;

  final TextInputAction? textInputAction;
  final bool? autoFocus;
  final Function()? onEditComplete;
  final double? contentPadding;
  final bool? enabled;
  const CustomFormField({this.prefixIconOnPressed,
    Key? key,
    this.maxLines = 1,
    this.contentPadding = 0,
    this.suffixIconOnPressed,
    this.suffixIcon,
    this.enabled,
    required this.hintText,
    this.prefixIcon,
    this.autoFocus,
    this.validator,
    this.onEditComplete,
    this.onSaved,
    this.textInputAction,
     this.obscureText,
    required this.textEditingController,
    required this.textInputType,
    this.onChanged,
  }) : super(key: key);

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}
class _CustomFormFieldState extends State<CustomFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingSize1),
      constraints: BoxConstraints(

        maxWidth: 400.w,
      ),
      child: Material(color: Theme.of(context).inputDecorationTheme.fillColor,

        child: TextFormField(enabled: widget.enabled??true,
          maxLines: widget.maxLines,
          onEditingComplete: widget.onEditComplete,
          autofocus: widget.autoFocus ?? false,
          textInputAction: widget.textInputAction,
          onChanged: widget.onChanged,
          autocorrect: false,
          enableSuggestions: false,
          style: TextStyle(
              color: AppColors.black,
              fontSize: AppSizes.fontSize14.sp),
          cursorColor: AppColors.black,
          keyboardType: widget.textInputType,
          onSaved: widget.onSaved,
          validator: widget.validator,
          obscureText: widget.obscureText??false,
cursorHeight: AppSizes.size16,
          controller: widget.textEditingController,
          decoration: InputDecoration(hintStyle: Theme.of(context).textTheme.subtitle1,
              contentPadding:
              EdgeInsets.all(widget.contentPadding??0 ),
              hintText: widget.hintText,
              prefixIcon: IconButton(onPressed: widget.prefixIconOnPressed,
                icon: Icon(widget.prefixIcon),
              ),
              suffixIcon: IconButton(
                onPressed: widget.suffixIconOnPressed,
                icon: Icon(widget.suffixIcon),
              )),
        ),
      ),
    );
  }
}
class CustomRoundedFormField extends StatefulWidget {
  final String hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final int? maxLines;
  final bool? obscureText;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final TextInputType textInputType;
  final TextEditingController textEditingController;
  final Function(String?)? onChanged;
  final Function()? suffixIconOnPressed;
  final Function()? prefixIconOnPressed;
  final String label;
  final TextInputAction? textInputAction;
  final bool? autoFocus;
  final Function()? onEditComplete;
  final double? contentPadding;
  final bool? enabled;
  const CustomRoundedFormField({this.prefixIconOnPressed,
    Key? key,
    this.maxLines = 1,
    this.contentPadding = 0,
    this.suffixIconOnPressed,
    required this.label,
    this.suffixIcon,
    this.enabled,
    required this.hintText,
    this.prefixIcon,
    this.autoFocus,
    this.validator,
    this.onEditComplete,
    this.onSaved,
    this.textInputAction,
    this.obscureText,
    required this.textEditingController,
    required this.textInputType,
    this.onChanged,
  }) : super(key: key);

  @override
  State<CustomRoundedFormField> createState() => _CustomRoundedFormFieldState();
}
class _CustomRoundedFormFieldState extends State<CustomRoundedFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(

        maxWidth: 400.w,
      ),
      child: TextFormField(enabled: widget.enabled??true,
        maxLines: widget.maxLines,
        onEditingComplete: widget.onEditComplete,
        autofocus: widget.autoFocus ?? false,
        textInputAction: widget.textInputAction,
        onChanged: widget.onChanged,
        autocorrect: false,
        enableSuggestions: false,
        style: TextStyle(
            color: AppColors.black,
            fontSize: AppSizes.fontSize14.sp),
        cursorColor: AppColors.black,
        keyboardType: widget.textInputType,
        onSaved: widget.onSaved,
        validator: widget.validator,
        obscureText: widget.obscureText??false,
        cursorHeight: AppSizes.size16,
        controller: widget.textEditingController,
        decoration: InputDecoration(hintStyle: Theme.of(context).textTheme.subtitle1,
            label: Text(widget.label,),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.radius50),
              borderSide:
              const BorderSide(color: LightAppColors.lightFocusedTextFieldBorderColor),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.radius50),
              borderSide:  const BorderSide(color: DarkAppColors.darkSubTextColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.radius50),
              borderSide:  const BorderSide(color: DarkAppColors.darkSubTextColor),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.radius50),
              borderSide:  const BorderSide(color: AppColors.red),
            ),
            contentPadding:
            EdgeInsets.all(widget.contentPadding??0 ),
            hintText: widget.hintText,
            prefixIcon: IconButton(onPressed: widget.prefixIconOnPressed,
              icon: Icon(widget.prefixIcon),
            ),
            suffixIcon: IconButton(
              onPressed: widget.suffixIconOnPressed,
              icon: Icon(widget.suffixIcon),
            )),
      ),
    );
  }
}

class CustomField extends StatefulWidget {
  final String hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final int? maxLines;
  final bool obscureText;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final TextInputType textInputType;
  final TextEditingController textEditingController;
  final Function(String?)? onChanged;
  final Function()? suffixIconOnPressed;
  final Function()? prefixIconOnPressed;

  final TextInputAction? textInputAction;
  final bool? autoFocus;
  final Function()? onEditComplete;
  final double? contentPadding;
  final bool? enabled;

  const CustomField({this.prefixIconOnPressed,
    Key? key,
    this.maxLines = 1,
    this.contentPadding = 0,
    this.suffixIconOnPressed,
    this.suffixIcon,
    this.enabled,
    required this.hintText,
    this.prefixIcon,
    this.autoFocus,
    this.validator,
    this.onEditComplete,
    this.onSaved,

    this.textInputAction,
    required this.obscureText,
    required this.textEditingController,
    required this.textInputType,
    this.onChanged,
  }) : super(key: key);

  @override
  State<CustomField> createState() => _CustomFieldState();
}
class _CustomFieldState extends State<CustomField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: AppSizes.size250,
        maxWidth: AppSizes.size400.w,
      ),
      child: Material(color: Theme.of(context).inputDecorationTheme.fillColor,
        borderRadius: BorderRadius.circular(AppSizes.radius50),
        child: TextFormField(enabled: widget.enabled??true,
          maxLines: widget.maxLines,
          onEditingComplete: widget.onEditComplete,
          autofocus: widget.autoFocus ?? false,
          textInputAction: widget.textInputAction,
          onChanged: widget.onChanged,
          autocorrect: false,
          enableSuggestions: false,
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: AppSizes.fontSize14.sp),
          cursorColor: Theme.of(context).primaryColor,
          keyboardType: widget.textInputType,
          onSaved: widget.onSaved,
          validator: widget.validator,
          obscureText: widget.obscureText,

          controller: widget.textEditingController,
          decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              hintStyle: Theme.of(context).textTheme.subtitle1,
              contentPadding:
              EdgeInsets.symmetric(vertical: widget.contentPadding ?? 0,horizontal:  widget.contentPadding ?? 0),
              hintText: widget.hintText,
              prefixIcon: IconButton(onPressed: widget.prefixIconOnPressed, icon: Icon(widget.prefixIcon,color: AppColors.blueGrey,)),
              suffixIcon: IconButton(onPressed: widget.suffixIconOnPressed, icon: Icon(widget.suffixIcon)),),
        ),
      ),
    );
  }
}


import 'package:cooking_recipes/config/theme/app_color/app_color_light.dart';
import 'package:flutter/material.dart';

import '../utils/app_font_weights.dart';
class CustomAppBar extends AppBar {
   CustomAppBar(  {Key? key,this.customLeadingWidth,this.customFlex,this.titleWidget,this.customElevation,this.customShape,  this.customTitle,required this.context,this.customLeading, this.customActions, this.customBottom,  this.bottomHeight, this.bgColor}): super(

   automaticallyImplyLeading: true,
   elevation: customElevation??0,

   centerTitle: false,
   iconTheme: const IconThemeData(color: LightAppColors.lightIconColor));
  final BuildContext context;
  final String? customTitle;
final Widget? customLeading;
   final double? customLeadingWidth;
   final Widget? customFlex;
   final Widget? titleWidget;
final List<Widget>? customActions;
final double? customElevation;
   Widget? customBottom;
  final double? bottomHeight;
  final Color? bgColor;
 final ShapeBorder? customShape;
   @override
 Color? get  foregroundColor=>  Theme.of(context).colorScheme.background;
   @override
  ShapeBorder? get shape => customShape;

   @override
  Widget? get title =>titleWidget?? Text(customTitle??'',style: Theme.of(context).textTheme.displayMedium!.copyWith(color: Theme.of(context).primaryColor),);
   @override
  Widget? get leading => customLeading;
   @override
   Widget? get flexibleSpace => customFlex;
   @override
  PreferredSizeWidget? get bottom => customBottom!=null? PreferredSize(
       preferredSize: Size.fromHeight(bottomHeight??0),
       child: customBottom!):null;
   @override
  List<Widget>? get actions => customActions;

   @override
  Color? get backgroundColor => Theme.of(context).appBarTheme.backgroundColor;

}

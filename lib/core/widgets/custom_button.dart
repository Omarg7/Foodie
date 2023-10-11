import 'package:cooking_recipes/config/theme/app_color/app_color.dart';
import 'package:flutter/material.dart';

import '../../config/localization/locale/app_localization.dart';
import '../utils/app_sizes.dart';
import '../utils/durations.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key,this.titleWidget ,this.onPressed,  this.title,  this.width,  this.height,  this.btnColor,  this.textColor}) : super(key: key);
  final Function()? onPressed;
  final String? title;
  final double? width;
  final double? height;
  final Color? btnColor;
  final Widget? titleWidget;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:width ?? (MediaQuery.of(context).size.width * .9 > AppSizes.size600? AppSizes.size600:MediaQuery.of(context).size.width * .85),
      height: height??AppSizes.size45,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: btnColor??Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSizes.radius50)),
          elevation: AppSizes.size2,
          animationDuration: AnimationDuration.microAnimationDuration200,
        ),
        onPressed: onPressed,
        child:titleWidget?? Text(
            AppLocalizations.of(context)!.translate(title??''),style:Theme.of(context).textTheme.displayMedium!.copyWith(color:onPressed!= null? textColor??Theme.of(context).colorScheme.background:AppColors.grey),
        ),
      ),
    );
  }
}
class BorderCustomButton extends StatelessWidget {
  const BorderCustomButton({Key? key, required this.width, required this.height, required this.bgColor, required this.fgColor, required this.title, required this.onTap, this.borderColor}) : super(key: key);
  final double width;
  final double height;
  final Color bgColor;
  final Color fgColor;
  final Color? borderColor;
  final String title;

  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(disabledBackgroundColor: AppColors.grey,disabledForegroundColor: AppColors.black,
            /*   overlayColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed))
                  return Colors.redAccent; //<-- SEE HERE
                return null; // Defer to the widget's default.
              },
            ),*/
            padding: EdgeInsets.zero,
            backgroundColor: bgColor,
            elevation: AppSizes.elevationZero,
            shape: RoundedRectangleBorder(side: BorderSide(color: borderColor??Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(AppSizes.radius5),
            )),
        onPressed: onTap ,
        child: Center(
          child: Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text(
                title,
                style:
                Theme.of(context).textTheme.titleSmall!.copyWith(color: fgColor),
              ),
               const SizedBox(width: AppSizes.size10,),
               const Icon(Icons.arrow_circle_down_sharp,color: AppColors.blueGrey,),
            ],
          ),
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/utils.dart';

import '../../../../core/utils/app_font_weights.dart';
import '../../../../config/localization/locale/app_localization.dart';



class ProfileTile extends StatelessWidget {
  const ProfileTile(
      {Key? key,
        this.onTap,

this.isLocation,
        required this.title,
        required this.leadingIcon,


        required this.iconColor,
         this.iconBGColor, required this.subtitle})
      : super(key: key);
  final Function()? onTap;
  final String title;
  final String subtitle;
  final IconData leadingIcon;

 final bool? isLocation;
  final Color iconColor;
  final Color? iconBGColor;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          subtitle:isLocation==true?  TextButton(onPressed: (){}, child: Text(subtitle)):Text(
          subtitle,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
          title: Text(
            AppLocalizations.of(context)!.translate(title) ,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          leading: Container(decoration:BoxDecoration(color:/*Color(0xFFE9A178)*/ /*Color(0xFFFAC748) */ Theme.of(context).primaryColor/*iconBGColor*/,shape: BoxShape.rectangle,borderRadius: BorderRadius.circular(AppSizes.radius10)),
            width: AppSizes.size40,height: AppSizes.size40,
            child: Center(
              child: Icon(
                leadingIcon,
                color: iconColor,
              ),
            ),
          ),


          visualDensity: VisualDensity.compact,
tileColor: Theme.of(context).colorScheme.background,

        ),
            ],
    );
  }
}

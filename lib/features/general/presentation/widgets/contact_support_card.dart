import 'package:flutter/material.dart';

import '../../../../config/localization/locale/app_localization.dart';
import '../../../../config/theme/app_color/app_color.dart';
import '../../../../core/utils/app_sizes.dart';

class ContactSupportCard extends StatelessWidget {
  const ContactSupportCard({Key? key,required this.title,this.onTap,required this.iconColor,required this.icon}) : super(key: key);
final   Function()? onTap;
final String title;
final IconData icon;
final Color iconColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onTap,
      child: Card(margin: EdgeInsets.zero,elevation: AppSizes.elevationZero,
        child: Container(
          height: AppSizes.size100,
          width: MediaQuery.of(context).size.width * .3,
          padding: const EdgeInsets.all(AppSizes.paddingSize8),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(AppSizes.radius10),color:Color(0xFFFAFAFA) ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
          Container(decoration: BoxDecoration( borderRadius: BorderRadius.circular(AppSizes.radius5),color: iconColor,),padding: const EdgeInsets.all(AppSizes.paddingSize8),child: Icon(icon,color: AppColors.white),),Text(AppLocalizations.of(context)!.translate(title),style: Theme.of(context).textTheme.headline5,),
        ],),
        ),
      ),
    );
  }
}

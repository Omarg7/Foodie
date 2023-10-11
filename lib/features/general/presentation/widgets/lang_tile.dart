
import 'package:flutter/material.dart';

import '../../../../core/utils/app_font_weights.dart';
import '../../../../config/theme/app_color/app_color.dart';
import '../../../../core/utils/utils.dart';

class LangTile extends StatelessWidget {
  const LangTile({Key? key, required this.selected, required this.leading, required this.title, this.onTap,}) : super(key: key);
final bool selected;
final String leading;
final String title;
final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: onTap,
      child: Container(padding: const EdgeInsets.symmetric(vertical: AppSizes.paddingSize8,horizontal: AppSizes.paddingSize16),color:selected? Theme.of(context).primaryColor:AppColors.transparent,child: Row(children: [
          Text(leading,style: const TextStyle(fontSize: AppSizes.size22),),const SizedBox(width: AppSizes.size20, ),Text(title,style: Theme.of(context).textTheme.headline4!.copyWith(color:selected? Theme.of(context).textTheme.headline4!.color:AppColors.grey,),),
      ],),),
    );
  }
}

import 'package:cooking_recipes/core/utils/app_font_weights.dart';
import 'package:flutter/material.dart';
import '../../../../config/theme/app_color/app_color.dart';
import '../../../../core/utils/utils.dart';


class BodyTitle extends StatelessWidget {
  const BodyTitle({Key? key, this.onPressed, required this.title,this.showSeeAll=false}) : super(key: key);
   final Function()? onPressed;
   final String title;
   final bool? showSeeAll;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppSizes.paddingSize16,right: AppSizes.paddingSize8,left: AppSizes.paddingSize8,bottom: AppSizes.paddingSize10 ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.grey.shade600),
          ),
          showSeeAll==true? InkWell(onTap:onPressed, child: Text('See All',style:Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).primaryColor,decoration: TextDecoration.underline),)):SizedBox.shrink()/*IconButton(onPressed: onPressed, icon: Icon(Icons.tune_outlined))*/,
        ],
      ),
    );
  }
}

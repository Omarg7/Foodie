import 'package:cached_network_image/cached_network_image.dart';
import 'package:cooking_recipes/config/theme/app_color/app_color_dark.dart';
import 'package:cooking_recipes/config/theme/presentation/theme_cubit/theme_cubit.dart';
import 'package:cooking_recipes/core/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/theme/app_color/app_color.dart';
import '../../../../core/utils/responsive_grid.dart';

class IngredientCard extends StatelessWidget {
  const IngredientCard({Key? key,required this.title,required this.measure}) : super(key: key);
final String title;
final String measure;
  @override
  Widget build(BuildContext context) {
    return Container( decoration: BoxDecoration(borderRadius: BorderRadius.circular(AppSizes.radius15),color: ThemeCubit.get(context).isDark? DarkAppColors.darkItemCardColor:Colors.grey.shade50) ,margin: EdgeInsets.zero,padding: const EdgeInsets.only(bottom: AppSizes.size10),
      child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CachedNetworkImage(fit: BoxFit.cover,
            width: CustomResponsive.width( AppSizes.size60,  AppSizes.size30, context),
            height:  CustomResponsive.height( AppSizes.size60,  AppSizes.size30, context),
            imageUrl: 'https://www.themealdb.com/images/ingredients/$title.png',
            progressIndicatorBuilder: (context, url,
                downloadProgress) =>
                const Center(
                  child: Icon(Icons.image,size: AppSizes.size35,color: AppColors.blueGrey,),
                ),
            errorWidget: (context, url, error) =>
            const Icon(Icons.error),
          ),

          FittedBox(fit: BoxFit.scaleDown,child: Text('$measure $title',style: Theme.of(context).textTheme.bodySmall,)),
        ],
      ),
    );
  }
}

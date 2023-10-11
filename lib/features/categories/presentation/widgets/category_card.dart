import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cooking_recipes/core/utils/app_font_weights.dart';
import 'package:cooking_recipes/features/categories/domain/entity/category_entity.dart';
import 'package:cooking_recipes/features/categories/presentation/cubit/categories_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/theme/app_color/app_color.dart';
import '../../../../config/theme/app_color/app_color_light.dart';
import '../../../../core/utils/responsive_grid.dart';
import '../../../../core/utils/utils.dart';
import '../../../meals/presentation/screens/food_details_screen.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({Key? key,required this.category,required this.selected}) : super(key: key);
final CategoryEntity category;
final bool selected;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: (){
     CategoriesCubit.get(context).selectCategory(category.name);
    },

      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Card(elevation: selected?0:3,
          margin: const EdgeInsets.all(AppSizes.marginSize5),
          color: selected? Colors.orange.shade200:AppColors.white,

          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.radius100)),
          child: Container(
            width: CustomResponsive.height( AppSizes.size80,  AppSizes.size40, context),
            height: CustomResponsive.height( AppSizes.size80,  AppSizes.size40, context),
            decoration: BoxDecoration(
                color:AppColors.white,
                backgroundBlendMode: BlendMode.dstOver,
                shape: BoxShape.circle,
                image: DecorationImage(
                    filterQuality: FilterQuality.medium,
                    fit: BoxFit.contain,
                    image: CachedNetworkImageProvider(
                      category.categoryThumb,
                    ))),
            margin: const EdgeInsets.all(AppSizes.marginSize2),
            child: BackdropFilter(
              filter: ImageFilter.blur(),
              child: Container(decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                shape: BoxShape.circle,
              ),

                child: FittedBox(fit:BoxFit.scaleDown ,
                  child: Text(
                    category.name,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(color:selected? Theme.of(context).colorScheme.surface:AppColors.white),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

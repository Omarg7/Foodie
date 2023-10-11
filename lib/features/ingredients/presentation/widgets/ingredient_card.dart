import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cooking_recipes/core/utils/app_font_weights.dart';
import 'package:cooking_recipes/features/areas/domain/entity/area_entity.dart';
import 'package:cooking_recipes/features/areas/presentation/cubit/areas_cubit.dart';
import 'package:cooking_recipes/features/categories/domain/entity/category_entity.dart';
import 'package:cooking_recipes/features/categories/presentation/cubit/categories_cubit.dart';
import 'package:cooking_recipes/features/ingredients/domain/entity/ingredient_entity.dart';
import 'package:cooking_recipes/features/ingredients/presentation/cubit/ingredients_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/theme/app_color/app_color.dart';
import '../../../../config/theme/app_color/app_color_light.dart';
import '../../../../core/utils/responsive_grid.dart';
import '../../../../core/utils/utils.dart';
import '../../../meals/presentation/screens/food_details_screen.dart';

class IngredientCard extends StatelessWidget {
  const IngredientCard({Key? key,required this.ingredient,required this.selected}) : super(key: key);
final IngredientEntity ingredient;
final bool selected;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: (){
      IngredientsCubit.get(context).selectIngredient(ingredient.id);
    },

      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Card(
          margin: const EdgeInsets.all(AppSizes.marginSize5),
          color: selected? LightAppColors.lightAccentColor:Theme.of(context).colorScheme.background,

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
                      'https://www.themealdb.com/images/ingredients/${ingredient.name}.png',
                    ))),
            margin: const EdgeInsets.all(AppSizes.marginSize2),
            child: BackdropFilter(
              filter: ImageFilter.blur(),
              child: Container(decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                shape: BoxShape.circle,
              ),

                child: FittedBox(fit:BoxFit.scaleDown ,
                  child: Text(
                    ingredient.name,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(color:selected? LightAppColors.lightAccentColor:AppColors.white),
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

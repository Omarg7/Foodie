import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cooking_recipes/core/utils/app_font_weights.dart';
import 'package:cooking_recipes/features/areas/domain/entity/area_entity.dart';
import 'package:cooking_recipes/features/areas/presentation/cubit/areas_cubit.dart';
import 'package:cooking_recipes/features/categories/domain/entity/category_entity.dart';
import 'package:cooking_recipes/features/categories/presentation/cubit/categories_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/theme/app_color/app_color.dart';
import '../../../../config/theme/app_color/app_color_light.dart';
import '../../../../core/prefrences/prefrences.dart';
import '../../../../core/utils/responsive_grid.dart';
import '../../../../core/utils/utils.dart';
import '../../../meals/presentation/screens/food_details_screen.dart';

class AreaCard extends StatelessWidget {
  const AreaCard({Key? key,required this.area,required this.selected}) : super(key: key);
final AreaEntity area;
final bool selected;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: (){
     AreasCubit.get(context).selectArea(area.name);
    },

      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Card(elevation: selected? 0:4 ,
          margin: const EdgeInsets.all(AppSizes.marginSize5),
          color: selected?LightAppColors.lightAccentColor:Theme.of(context).colorScheme.background,

          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.radius50)),
          child: Container(
            width: CustomResponsive.height( AppSizes.size80,  AppSizes.size40, context),
            height: CustomResponsive.height( AppSizes.size80,  AppSizes.size40, context),
            decoration: BoxDecoration(
                color:selected? AppColors.white:AppColors.grey300,
                borderRadius: BorderRadius.circular(AppSizes.radius50),
                ),
            margin: const EdgeInsets.all(AppSizes.marginSize2),
            child: FittedBox(fit:BoxFit.scaleDown ,
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(Consts.getFlagByCountry(area.name),style: Theme.of(context).textTheme.displayMedium),
SizedBox(height: AppSizes.size10,),
                  Text(
                    area.name,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(color:selected? LightAppColors.lightAccentColor:AppColors.black),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cooking_recipes/features/auth/presentation/cubit/auth/auth_cubit.dart';
import 'package:cooking_recipes/features/categories/presentation/cubit/categories_cubit.dart';
import 'package:cooking_recipes/shared/domain/entity/meal_entity.dart';
import 'package:cooking_recipes/features/meals/presentation/cubit/meal_details/meal_details_cubit.dart';
import 'package:cooking_recipes/features/meals/presentation/screens/food_details_screen.dart';
import 'package:cooking_recipes/core/widgets/favourite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/theme/app_color/app_color.dart';
import '../../../../core/utils/app_sizes.dart';


class MealCard extends StatelessWidget {
  final MealEntity meal;

  const  MealCard({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: ()
    {
      MealDetailsCubit.get(context).loadMealById(meal.mealId.toString());
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => FoodDetailsScreen(),));

    }, child: Stack(
      children: [
        Card(margin: const EdgeInsets.all(AppSizes.marginSize8),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.radius10),),
          child: Container(
            width: double.maxFinite,

            decoration: BoxDecoration(borderRadius: BorderRadius.circular(AppSizes.radius10),
                color:AppColors.white,
                backgroundBlendMode: BlendMode.dstOver,

                image: DecorationImage(
                    filterQuality: FilterQuality.medium,
                    fit: BoxFit.cover,
                    image: CachedNetworkImageProvider(
                      meal.thumbnail,
                    ))),

            child: Stack(
              children: [
                BackdropFilter(
                  filter: ImageFilter.blur(),
                  child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(AppSizes.radius10),
                    color: Colors.black.withOpacity(0.6),

                  ),


                  ),
                ),
                Positioned(bottom: AppSizes.size10,child: SizedBox(width: AppSizes.size200,
                  child: ListTile(
                    minLeadingWidth: 0,horizontalTitleGap: 0,contentPadding: const EdgeInsets.symmetric(horizontal:AppSizes.size8),
                    title:  Text(
                        meal.name,
                        style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: AppColors.textOnImage)
                    ),

                    subtitle: const Text(
                      'Recipe',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white70,
                      ),
                    ),),
                ))
              ],
            ),
          ),
        ),
        Positioned(right: AppSizes.size14,top: AppSizes.size14,child: FavouriteButton(meal: meal,iconSize: AppSizes.size20,bgSize: AppSizes.size35),)
      ],
    ),
    );
  }
}
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cooking_recipes/core/widgets/favourite_button.dart';
import 'package:cooking_recipes/shared/domain/entity/meal_entity.dart';
import 'package:flutter/material.dart';

import '../../../../config/theme/app_color/app_color.dart';
import '../../../../core/prefrences/prefrences.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../auth/presentation/cubit/auth/auth_cubit.dart';
import '../../../meals/presentation/cubit/meal_details/meal_details_cubit.dart';
import '../../../meals/presentation/screens/food_details_screen.dart';

class RecommendationMealCard extends StatelessWidget {
  const RecommendationMealCard({Key? key,required this.meal,required this.subtitle}) : super(key: key);
final MealEntity meal;
final String subtitle;
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

                      subtitle: Text(
                        '$subtitle Recipe',
            style: const TextStyle(
            fontSize: 14,
            color: Colors.white70,
            ),
            ),),
                  ))
                ],
              ),
            ),
        ),
        Positioned(child: FavouriteButton(meal: meal,iconSize: AppSizes.size20,bgSize: AppSizes.size35),right: AppSizes.size14,top: AppSizes.size14,)
      ],
    ),
    );
  }
}

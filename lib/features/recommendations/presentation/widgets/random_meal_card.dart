import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cooking_recipes/features/recommendations/presentation/cubit/recommendations_cubit.dart';
import 'package:flutter/material.dart';

import '../../../../config/theme/app_color/app_color.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../shared/domain/entity/meal_entity.dart';

class MealOfTheDayCard extends StatelessWidget {
/*  final MealEntity meal;

  RandomMealWidget({required this.meal});*/

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MealEntity>(
      future: RecommendationsCubit.get(context).getRandomMeal(),
      builder: (context, snapshot) {
      if(snapshot.connectionState == ConnectionState.done ||snapshot.hasData ){
        MealEntity meal=snapshot.data!;
        return Card(
          child: Stack(
            children: [
              Container(
                width: double.maxFinite,
               height: AppSizes.size350,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(AppSizes.radius5),
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
                      child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(AppSizes.radius5),
                        color: Colors.black.withOpacity(0.6),

                      ),

                       
                      ),
                    ),
                    Positioned(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          meal.name,
                          style: Theme.of(context).textTheme.displayMedium!.copyWith(color: AppColors.textOnImage)
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Category: ${meal.category}',
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Area: ${meal.area}',
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Ingredients: ${meal.ingredients.length}',
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Instructions: ${meal.instructions.length}',
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),bottom: AppSizes.size50,left: AppSizes.size20,)
                  ],
                ),
              ),

            ],
          ),
        );
      }
      else if(snapshot.connectionState==ConnectionState.waiting){
       return const Center(child: CircularProgressIndicator(),);
      }
      else{
        return const Center(
          child: Text('Error loading the meal of the day'),
        );
      }

    },

    );
  }
}
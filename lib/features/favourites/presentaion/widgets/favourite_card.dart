import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cooking_recipes/core/widgets/favourite_button.dart';
import 'package:cooking_recipes/core/widgets/youtube_button.dart';
import 'package:cooking_recipes/shared/domain/entity/meal_entity.dart';
import 'package:flutter/material.dart';

import '../../../../config/theme/app_color/app_color.dart';
import '../../../../core/prefrences/prefrences.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../auth/presentation/cubit/auth/auth_cubit.dart';
import '../../../meals/presentation/cubit/meal_details/meal_details_cubit.dart';
import '../../../meals/presentation/screens/food_details_screen.dart';

class FavouriteCard extends StatelessWidget {
  const FavouriteCard({Key? key,required this.meal,required this.subtitle}) : super(key: key);
  final MealEntity meal;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: ()
    {
      MealDetailsCubit.get(context).loadMealById(meal.mealId.toString());
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => FoodDetailsScreen(),));

    }, child: Stack(clipBehavior: Clip.none,
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

            child: BackdropFilter(
              filter: ImageFilter.blur(),
              child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(AppSizes.radius10),
                color: Colors.black.withOpacity(0.6),

              ),


              ),
            ),
          ),
        ),
        Positioned(top: AppSizes.size80,child: SizedBox(width: AppSizes.size200,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ListTile(
              minLeadingWidth:10,horizontalTitleGap: 10,contentPadding: const EdgeInsets.symmetric(horizontal:AppSizes.size8,vertical: AppSizes.size4),
              title:  Text(
                  meal.name.split(" ").length >= 6 && MediaQuery.sizeOf(context).height<650?meal.name.split(" ").sublist(0, 6).join(" "):meal.name,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: AppColors.textOnImage)
              ),

              subtitle: Text(overflow: TextOverflow.clip,maxLines: 6,
                  '\n${meal.name} is a ${meal.area} ${meal.category} meal, That includes a delightful combination of ${meal.ingredients.length} ingredients...',style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white70)
              ),),
          ),
        )),
        Positioned(bottom: -5,right: AppSizes.size10,left: AppSizes.size10,child: YoutubeButton(videoLink: meal.youtubeLink, instructions: meal.instructions,icon: true),),
        Positioned(right: AppSizes.size14,top: AppSizes.size14,child: FavouriteButton(meal: meal,iconSize: AppSizes.size20,bgSize: AppSizes.size35),)
      ],
    ),
    );
  }
}

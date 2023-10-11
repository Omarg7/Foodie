import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cooking_recipes/core/utils/app_font_weights.dart';
import 'package:cooking_recipes/core/utils/responsive_grid.dart';
import 'package:cooking_recipes/shared/domain/entity/meal_entity.dart';
import 'package:cooking_recipes/core/widgets/favourite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/theme/app_color/app_color.dart';
import '../../../../core/utils/utils.dart';
import '../../../meals/presentation/cubit/meal_details/meal_details_cubit.dart';
import '../../../meals/presentation/screens/food_details_screen.dart';
import '../../../meals/presentation/widgets/meal_tags_list.dart';
import '../../../../core/widgets/recipe_blog_button.dart';
import '../../../../core/widgets/youtube_button.dart';

class FavouriteMealCard extends StatelessWidget {
  const FavouriteMealCard({Key? key,required this.meal,required this.controller,required this.index}) : super(key: key);
final MealEntity meal;
final PageController controller;
final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: (){
      MealDetailsCubit.get(context).loadMealById(meal.mealId.toString());
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => FoodDetailsScreen(),));
    },
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          double value = 1.0;
          if (controller.position.haveDimensions) {
            value = controller.page! - index;
            value = (1 - (value.abs() * .4)).clamp(.7, 1.0);
          }

          return Center(
            child: SizedBox(
              height: Curves.easeOut.transform(value) *(MediaQuery.sizeOf(context).height *.7),
              width: Curves.easeOut.transform(value) * (MediaQuery.sizeOf(context).width * 1),
              child: child,
            ),
          );
        },
        child: Stack(
          children: [
            Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.radius20)),
              margin: const EdgeInsets.all(AppSizes.marginSize8),

              child: Container(

                decoration: BoxDecoration(borderRadius: BorderRadius.circular(AppSizes.radius20),
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
                  child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(AppSizes.radius20),
                    color: Colors.black.withOpacity(0.6),

                  ),


                  ),
                ),
              ),
            ),
            Positioned(
              left: AppSizes.size20,
              top:MediaQuery.sizeOf(context).height<650? AppSizes.size50:CustomResponsive.height(AppSizes.size180, AppSizes.size80, context),
              child:  SizedBox(width: AppSizes.size250.w,
                child: ListTile(
                  isThreeLine: true,
                  title: Text(meal.name.split(" ").length >= 5 && MediaQuery.sizeOf(context).height<650?meal.name.split(" ").sublist(0, 5).join(" "):meal.name,style: Theme.of(context).textTheme.displayLarge!.copyWith(color: AppColors.white),),
                  subtitle: Column(children: [
                    const SizedBox(height: AppSizes.size10,),
                    Text('${meal.name} is a ${meal.area} ${meal.category} meal, That includes a delightful combination of ${meal.ingredients.length} ingredients...',style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white70)),
                    const SizedBox(height: AppSizes.size10,),
                    Align(alignment: Alignment.centerLeft,child: Text(textAlign: TextAlign.left,'First: ${meal.instructions[0]}',style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white70),maxLines: 2,overflow: TextOverflow.ellipsis,)),
                    const SizedBox(height: AppSizes.size20,),
                    MediaQuery.sizeOf(context).height<720?  SizedBox():MealTagsList(tags:meal.tags),
                  ]),
                ),
              ),),
            Positioned(top: AppSizes.size25,right: AppSizes.size25,child: FavouriteButton(meal: meal)),
            Positioned(bottom: AppSizes.size20,child: SizedBox(width:MediaQuery.sizeOf(context).width * .8,
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  YoutubeButton(instructions:meal.instructions,
                      videoLink:meal.youtubeLink,

                  ),

                ],
              ),
            ),),
          ],
        ),
      ),
    );
  }
}

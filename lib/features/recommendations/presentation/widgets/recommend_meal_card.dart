import 'package:cached_network_image/cached_network_image.dart';
import 'package:cooking_recipes/core/widgets/favourite_button.dart';
import 'package:cooking_recipes/shared/domain/entity/meal_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/theme/app_color/app_color.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../core/utils/responsive_grid.dart';
import '../../../meals/presentation/cubit/meal_details/meal_details_cubit.dart';
import '../../../meals/presentation/screens/food_details_screen.dart';

class RecommendMealCard extends StatelessWidget {
  final MealEntity meal;

const  RecommendMealCard({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: (){
      MealDetailsCubit.get(context).loadMealById(meal.mealId.toString());
      Navigator.push(context, MaterialPageRoute(builder: (context) => FoodDetailsScreen(),));
    },
      child: Container(width: CustomResponsive.height( AppSizes.size160,  AppSizes.size70, context),

        decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(AppSizes.radius15),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(AppSizes.radius15),
              child:CachedNetworkImage(fit: BoxFit.cover,
width: CustomResponsive.width( AppSizes.size140,  AppSizes.size60, context),
                height: CustomResponsive.height(MediaQuery.sizeOf(context).height<720? AppSizes.size150:AppSizes.size160,MediaQuery.sizeOf(context).width<720?  AppSizes.size70:AppSizes.size80, context),
                imageUrl: meal.thumbnail,
                progressIndicatorBuilder: (context, url,
                    downloadProgress) =>
                const Center(
                  child: Icon(Icons.image,size: AppSizes.size35,color: AppColors.blueGrey,),
                ),
                errorWidget: (context, url, error) =>
                const Icon(Icons.error),
              ),
            ),

            Expanded(
              child: ListTile(contentPadding: EdgeInsets.only(right:AppSizes.paddingSize20.w ),minVerticalPadding: 0,
                dense: true,

                visualDensity: VisualDensity.compact,
                title: Text(maxLines: 2,overflow: TextOverflow.ellipsis,
                 meal.name,
                  style: Theme.of(context).textTheme.headlineSmall
                ),

              ),
            ),
          ],
        ),
      ),
    );
  }
}
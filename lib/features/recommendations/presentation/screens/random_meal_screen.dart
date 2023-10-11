import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cooking_recipes/core/widgets/custom_app_bar.dart';
import 'package:cooking_recipes/features/meals/presentation/widgets/meal_card.dart';
import 'package:cooking_recipes/features/recommendations/presentation/cubit/recommendations_cubit.dart';
import 'package:cooking_recipes/features/recommendations/presentation/widgets/random_meal_card.dart';
import 'package:cooking_recipes/shared/domain/entity/meal_entity.dart';
import 'package:flutter/material.dart';

import '../../../../config/localization/locale/app_localization.dart';
import '../../../../config/theme/app_color/app_color.dart';
import '../../../../core/utils/app_sizes.dart';

class RandomMealScreen extends StatefulWidget {
  const RandomMealScreen({super.key});

  @override
  _RandomMealScreenState createState() => _RandomMealScreenState();
}

class _RandomMealScreenState extends State<RandomMealScreen> with SingleTickerProviderStateMixin {
 late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            iconTheme: Theme.of(context).appBarTheme.iconTheme,
            expandedHeight: AppSizes.size350,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding:  AppLocalizations.of(context)!.isEnLocale? const EdgeInsets.only(
                  left: AppSizes.size60,
                  bottom: AppSizes.paddingSize10,
                  top: AppSizes.paddingSize5):const EdgeInsets.only(
                  right: AppSizes.size60,
                  bottom: AppSizes.paddingSize10,
                  top: AppSizes.paddingSize5),

              background: Container(
                width: double.maxFinite,

                decoration: BoxDecoration(borderRadius: BorderRadius.circular(AppSizes.radius5),
                    color:AppColors.white,
                    backgroundBlendMode: BlendMode.dstOver,

                    image: const DecorationImage(
                        filterQuality: FilterQuality.medium,
                        fit: BoxFit.cover,
                        image: CachedNetworkImageProvider(
                          'https://www.acouplecooks.com/wp-content/uploads/2021/03/Cheese-Tortellini-011.jpg',
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
                    Positioned(bottom: AppSizes.size50,left: AppSizes.size20,child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                           ' meal.name',
                            style: Theme.of(context).textTheme.displayMedium!.copyWith(color: AppColors.textOnImage)
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Category: meal.category',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        const Text(
                          'Area:meal.area',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Ingredients:meal.ingredients.length',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        const Text(
                          'Instructions:meal.instructions.length',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),)
                  ],
                ),
              ),
            ),
            floating: true,
            snap: true,
            pinned: true,
          )
        ],
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(AppSizes.paddingSize10),
                child: Column(
                  children: [
                    Row(children: [

                      Text(
                        AppLocalizations.of(context)!.translate(AppStrings.workingHours),
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      const SizedBox(
                        width: AppSizes.size10,
                      ),
                    ]),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            AppLocalizations.of(context)!.translate(AppStrings.ezzatWorkingHours)
                            ,
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
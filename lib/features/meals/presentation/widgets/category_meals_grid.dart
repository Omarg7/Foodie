import 'package:cooking_recipes/core/utils/app_font_weights.dart';
import 'package:cooking_recipes/features/auth/presentation/cubit/auth/auth_cubit.dart';
import 'package:cooking_recipes/features/favourites/presentaion/cubit/favourites_cubit.dart';
import 'package:cooking_recipes/features/meals/presentation/cubit/meals/meals_cubit.dart';
import 'package:cooking_recipes/features/meals/presentation/widgets/meals_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'meal_card.dart';

class CategoryMealsGrid extends StatelessWidget {
  const CategoryMealsGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MealsCubit, MealsState>(builder: (context, mealsState) {
      if (mealsState is MealsLoaded) {
        return MealsGrid(meals: mealsState.meals);
      } else if (mealsState is MealsLoading) {
        return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()));
      } else if (mealsState is MealsEmpty) {
        return const SliverToBoxAdapter(child: Text('Empty list'));
      } else if (mealsState is MealsError) {
        return SliverToBoxAdapter(child: Text(mealsState.error));
      }
      else {
        return const SliverToBoxAdapter(child: SizedBox());
      }
    }, listener: (context, state) {

    },);
  }
}

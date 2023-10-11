
import 'package:cooking_recipes/features/areas/presentation/cubit/areas_cubit.dart';
import 'package:cooking_recipes/features/categories/presentation/widgets/category_card.dart';
import 'package:cooking_recipes/features/ingredients/presentation/cubit/ingredients_cubit.dart';
import 'package:cooking_recipes/features/meals/presentation/cubit/meals/meals_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/responsive_grid.dart';
import '../../../../core/utils/utils.dart';
import '../../../meals/presentation/cubit/meals_filtering/meals_filtering_cubit.dart';
import 'ingredient_card.dart';

class IngredientsTabBar extends StatefulWidget {

  IngredientsTabBar({super.key});

  @override
  State<IngredientsTabBar> createState() => _IngredientsTabBarState();
}

class _IngredientsTabBarState extends State<IngredientsTabBar> {
  @override
  void initState() {
    IngredientsCubit.get(context).loadIngredients();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Container(color: Theme.of(context).colorScheme.background,
      child: Column(mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [


          SizedBox(
            height: CustomResponsive.height( AppSizes.size80,  AppSizes.size40, context),
            child: BlocBuilder<IngredientsCubit, IngredientsState>(

              builder: (context, state) {

                if(state is IngredientsLoadedState){
                  MealsCubit.get(context).loadMeals(FilterOption.ingredients,state.selectedIngredient.name);

                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.ingredients.length,
                    itemBuilder: (_, index) {
                      final ingredient = state.ingredients[index];
                      return  IngredientCard(ingredient: ingredient,selected:state.selectedIngredient.name==state.ingredients[index].name);
                    },
                  );
                }else if(state is IngredientsLoadingState){
                  return const Center(child: CircularProgressIndicator());
                } else if(state is IngredientsErrorState){
                  return  Text(state.error);
                }else{
                  return const Text('empty list');
                }
              },
            ),
          ),


        ],
      ),
    );
  }
}

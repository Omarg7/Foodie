
import 'package:cooking_recipes/features/categories/presentation/widgets/category_card.dart';
import 'package:cooking_recipes/features/meals/presentation/cubit/meals/meals_cubit.dart';
import 'package:cooking_recipes/features/meals/presentation/cubit/meals_filtering/meals_filtering_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/responsive_grid.dart';
import '../../../../core/utils/utils.dart';
import '../cubit/categories_cubit.dart';

class CategoriesTabBar extends StatefulWidget {

  CategoriesTabBar({super.key});

  @override
  State<CategoriesTabBar> createState() => _CategoriesTabBarState();
}

class _CategoriesTabBarState extends State<CategoriesTabBar> {
  @override
  void initState() {
    CategoriesCubit.get(context).loadCategories();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
print('from build category');
    return Container(color: Theme.of(context).colorScheme.background,
      child: Column(mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [


          SizedBox(
            height: CustomResponsive.height( AppSizes.size80,  AppSizes.size40, context),
            child: BlocBuilder<CategoriesCubit, CategoriesState>(

              builder: (context, state) {

                if(state is CategoriesLoadedState){

                  MealsCubit.get(context).loadMeals(FilterOption.categories,state.category.name);
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.categories.length,
                    itemBuilder: (_, index) {
                      final category = state.categories[index];
                      return CategoryCard(category: category,selected:state.category.name==state.categories[index].name);
                    },
                  );
                }else if(state is CategoriesLoadingState){
                  return const Center(child: CircularProgressIndicator());
                } else if(state is CategoriesErrorState){
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

import 'package:cooking_recipes/features/areas/presentation/widgets/areas_tabbar.dart';
import 'package:cooking_recipes/features/categories/presentation/widgets/categories_tabbar.dart';
import 'package:cooking_recipes/features/meals/presentation/cubit/meals_filtering/meals_filtering_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/utils.dart';
import '../../../ingredients/presentation/widgets/ingredients_tabbar.dart';
import 'body_title.dart';

class TabBarListView extends StatefulWidget {
  const TabBarListView({super.key});

  @override
  State<TabBarListView> createState() => _TabBarListViewState();
}

class _TabBarListViewState extends State<TabBarListView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          BlocBuilder<MealsFilteringCubit, MealsFilteringState>(
            builder: (context, state) {
              if (state.option == FilterOption.categories) {
                return    CategoriesTabBar();
              } else if (state.option == FilterOption.countries) {
                return CountriesTabBar();
              } else {
                return IngredientsTabBar();
              }
            },
          ),
        ],
      ),
    );
  }
}

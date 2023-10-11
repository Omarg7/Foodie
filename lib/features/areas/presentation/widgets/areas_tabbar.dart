
import 'package:cooking_recipes/features/areas/presentation/cubit/areas_cubit.dart';
import 'package:cooking_recipes/features/areas/presentation/widgets/area_card.dart';
import 'package:cooking_recipes/features/categories/presentation/widgets/category_card.dart';
import 'package:cooking_recipes/features/meals/presentation/cubit/meals/meals_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/responsive_grid.dart';
import '../../../../core/utils/utils.dart';
import '../../../meals/presentation/cubit/meals_filtering/meals_filtering_cubit.dart';

class CountriesTabBar extends StatefulWidget {

  CountriesTabBar({super.key});

  @override
  State<CountriesTabBar> createState() => _CountriesTabBarState();
}

class _CountriesTabBarState extends State<CountriesTabBar> {
  @override
  void initState() {
    AreasCubit.get(context).loadAreas();
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
            child: BlocBuilder<AreasCubit, AreasState>(

            builder: (context, state) {

                if(state is AreasLoadedState){
                  MealsCubit.get(context).loadMeals(FilterOption.countries,state.area.name);
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.areas.length,
                    itemBuilder: (_, index) {
                      final area = state.areas[index];
                      return  AreaCard(area: area, selected: state.area.name==area.name)/*CategoryCard(category: area,selected:state.category.name==state.categories[index].name)*/;
                    },
                  );
                }else if(state is AreasLoadingState){
                  return const Center(child: CircularProgressIndicator());
                } else if(state is AreasErrorState){
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

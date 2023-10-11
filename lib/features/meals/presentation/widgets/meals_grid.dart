import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../core/utils/app_sizes.dart';
import '../../../../core/utils/responsive_grid.dart';
import '../../../../shared/domain/entity/meal_entity.dart';
import '../../../auth/presentation/cubit/auth/auth_cubit.dart';
import '../../../favourites/presentaion/cubit/favourites_cubit.dart';
import 'meal_card.dart';

class MealsGrid extends StatelessWidget {
  const MealsGrid({Key? key,required this.meals}) : super(key: key);
  final List<MealEntity> meals;
  @override
  Widget build(BuildContext context) {

    return SliverGrid.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) {
          return  MealCard(meal: meals[index],);
        },
        gridDelegate:  CustomResponsive. grid(MediaQuery.sizeOf(context).height, MediaQuery.sizeOf(context).width));
  }
}

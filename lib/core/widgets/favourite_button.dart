import 'package:cooking_recipes/features/favourites/presentaion/cubit/favourites_cubit.dart';
import 'package:cooking_recipes/shared/domain/entity/meal_entity.dart';
import 'package:cooking_recipes/features/meals/presentation/cubit/meal_details/meal_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../config/theme/app_color/app_color.dart';
import '../utils/app_sizes.dart';
import '../../features/auth/presentation/cubit/auth/auth_cubit.dart';
import 'custom_icon_button.dart';

class FavouriteButton extends StatefulWidget {
  const FavouriteButton({Key? key,required this.meal, this.iconSize,this.bgSize}) : super(key: key);
final MealEntity meal;
final double? iconSize;
  final double? bgSize;
  @override
  State<FavouriteButton> createState() => _FavouriteButtonState();
}

class _FavouriteButtonState extends State<FavouriteButton> {
  late ValueNotifier<bool> isFav;
  @override
  void initState() {

    super.initState();
  }
  @override
  void dispose() {
    isFav.dispose();

    super.dispose();
  }
  @override
  void didChangeDependencies() {
    isFav=ValueNotifier(FavouritesCubit.get(context).checkIfFav(widget.meal.mealId));

    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {

    return ValueListenableBuilder(
        valueListenable: isFav,builder: (context, value, child) {
      return CustomIconButton(
          iconSize:widget.iconSize?? AppSizes.size25,
          boxShape: BoxShape.circle,
          icon: isFav.value ? Icons.bookmark : Icons.bookmark_border,
          onTap: () async{
            isFav.value=!isFav.value;

            MealEntity meal= widget.meal.instructions.isEmpty && isFav.value?  await MealDetailsCubit.get(context).getMealById(widget.meal.mealId.toString()):widget.meal;

            if(!mounted) return;
            FavouriteSuccess res=await FavouritesCubit.get(context).updateFav(meal, isFav.value,AuthCubit.get(context).userId.toString());
            isFav.value=res.isSuccess;
            Fluttertoast.showToast(msg: res.message);

          },
          size:widget.bgSize?? AppSizes.size40,
          iconColor: AppColors.yellow,
          backgroundColor: Theme
              .of(context)
              .colorScheme
              .background);

    }
    ) ;
  }
}

import 'package:cooking_recipes/core/utils/app_font_weights.dart';
import 'package:cooking_recipes/features/auth/presentation/cubit/user_preferences/user_preferences_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/dropdown_with_search.dart';

class RecommendationField extends StatelessWidget {
  const RecommendationField({Key? key,required this.recommendations,required this.recommendationController,required this.recommendationFocusNode}) : super(key: key);
  final FocusNode recommendationFocusNode;
  final TextEditingController recommendationController;
  final List recommendations;
  @override
  Widget build(BuildContext context) {
    return   DropdownWithSearch(items: recommendations,selected: UserPreferencesCubit.get(context).recommendation,focusNode: recommendationFocusNode,textController: recommendationController,
      title: 'Favourite Food',
      placeHolder: 'Search for food',
      disabled: false,


      dropdownHeadingStyle: Theme.of(context).textTheme.displaySmall,
      itemStyle: Theme.of(context).textTheme.headlineMedium,
      dialogRadius: AppSizes.radius15,
      searchBarRadius: AppSizes.radius15,
      label: 'Favourite food',
      //onChanged: (value) => _onSelectedState(value),
      onChanged: (value)
      => UserPreferencesCubit.get(context).selectRecommendation(value),
    );
  }
}

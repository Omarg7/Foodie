import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/localization/locale/app_localization.dart';
import '../cubit/meals_filtering/meals_filtering_cubit.dart';
import 'body_title.dart';

class TabBarHeader extends StatelessWidget {
  const TabBarHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<MealsFilteringCubit, MealsFilteringState>(
      builder: (context, state) {
        if (state.option == FilterOption.categories) {
          return     BodyTitle(
            title: AppLocalizations.of(context)!.translate(AppStrings.categories),
            showSeeAll: false,

          );
        } else if (state.option == FilterOption.countries) {
          return BodyTitle(
            title: AppLocalizations.of(context)!.translate(AppStrings.countries),
            showSeeAll: false,

          );;
        } else {
          return BodyTitle(
            title: AppLocalizations.of(context)!.translate(AppStrings.ingredients),
            showSeeAll: false,

          );
        }
      },
    );
  }
}

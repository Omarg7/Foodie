import 'package:cooking_recipes/features/auth/presentation/cubit/auth/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/user_preferences/user_preferences_cubit.dart';
import 'area_selection_field.dart';
import 'recommendation_field.dart';

class UserPreferencesFields extends StatefulWidget {
  const UserPreferencesFields({Key? key,required this.fromUpdate}) : super(key: key);
  final bool fromUpdate;
  @override
  State<UserPreferencesFields> createState() => _UserPreferencesFieldsState();
}

class _UserPreferencesFieldsState extends State<UserPreferencesFields> {
  late final FocusNode preferredCountryFN;

  late final FocusNode recommendationFN;
  late final TextEditingController preferredCountryController;
  late final TextEditingController recommendationController;
@override
  void initState() {
  recommendationFN=FocusNode();
  recommendationController=TextEditingController(text: widget.fromUpdate? AuthCubit.get(context).currentUser.favFoodType:UserPreferencesCubit.get(context).recommendation);
  preferredCountryController =
      TextEditingController(text:widget.fromUpdate? AuthCubit.get(context).currentUser.area:UserPreferencesCubit.get(context).area);
  UserPreferencesCubit.get(context).initialize(country: widget.fromUpdate? AuthCubit.get(context).currentUser.area:UserPreferencesCubit.get(context).area,foodType:widget.fromUpdate? AuthCubit.get(context).currentUser.favFoodType:UserPreferencesCubit.get(context).recommendation );
  preferredCountryFN = FocusNode();

  super.initState();
  }
  @override
  void dispose() {
    recommendationFN.dispose();
    recommendationController.dispose();
    preferredCountryController.dispose();
    preferredCountryFN.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserPreferencesCubit, UserPreferencesState>(
      listener: (context, state) {
        preferredCountryController.text =
            state.selectedArea;
        recommendationController.text=state.selectedRecommendation;
      },
      builder: (context, state) {
        return Column(
          children: [
            PreferredCountryField(
                preferredCountryFocusNode: preferredCountryFN,
                preferredCountryController:
                preferredCountryController),
            RecommendationField(recommendations: state.recommendations,recommendationController: recommendationController, recommendationFocusNode: recommendationFN),

          ],
        );
      },
    );
  }
}

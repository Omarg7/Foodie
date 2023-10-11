import 'package:cooking_recipes/core/utils/app_font_weights.dart';
import 'package:cooking_recipes/core/prefrences/prefrences.dart';
import 'package:cooking_recipes/core/widgets/custom_app_bar.dart';
import 'package:cooking_recipes/features/auth/presentation/cubit/auth/auth_cubit.dart';
import 'package:cooking_recipes/features/recommendations/presentation/cubit/recommendations_cubit.dart';
import 'package:cooking_recipes/features/recommendations/presentation/widgets/recommendation_meal_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/responsive_grid.dart';
import '../../../../core/utils/utils.dart';

import '../../../auth/presentation/cubit/user_preferences/user_preferences_cubit.dart';
import '../../../meals/presentation/widgets/body_title.dart';

class RecommendationScreen extends StatefulWidget {
  const RecommendationScreen({super.key});

  @override
  State<RecommendationScreen> createState() => _RecommendationScreenState();
}

class _RecommendationScreenState extends State<RecommendationScreen> {
  @override
  void initState() {
    RecommendationsCubit.get(context).getUserRecommendations(AuthCubit.get(context).currentUser.area,AuthCubit.get(context).currentUser.favFoodType);
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context: context,
        customTitle:'Recommendations',
      ),
      body: CustomScrollView(
        slivers: [
          BlocBuilder<RecommendationsCubit,RecommendationsState>(builder: (context, state) {
            if(state is RecommendationsLoaded){
              return SliverToBoxAdapter(child: Text('   ${state.recommendations.length} Recommended recipes just for u.', style: Theme.of(context).textTheme.displaySmall,),);
            }else{
              return SliverToBoxAdapter(child: Text('No recommended recipes for now!', style: Theme.of(context).textTheme.displaySmall,),);

            }
          },),
          BlocBuilder<RecommendationsCubit, RecommendationsState>(
  builder: (context, state) {
    if(state is RecommendationsLoaded){

      return SliverGrid(
        gridDelegate:CustomResponsive.grid(MediaQuery.sizeOf(context).height, MediaQuery.sizeOf(context).width),
        delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
            return RecommendationMealCard(meal: state.recommendations[index],subtitle: '',);
          },
          childCount: state.recommendations.length,
        ),
      );
    }else if(state is RecommendationsLoading){
      return const SliverToBoxAdapter(child: Center(child: CircularProgressIndicator()),);
    }else if(state is RecommendationsEmpty){
      return const SliverToBoxAdapter(child: Center(child: Text('empty')),);
    }else{
      return const SliverToBoxAdapter(child: Center(child: Text('error')),);
    }
  },
),
          const SliverToBoxAdapter(child: SizedBox(height: AppSizes.size70,),)
        ],
      ),
    );
  }
}
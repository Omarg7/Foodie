import 'package:cooking_recipes/features/auth/presentation/cubit/auth/auth_cubit.dart';
import 'package:cooking_recipes/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_sizes.dart';
import '../../../../core/utils/responsive_grid.dart';
import '../../../favourites/presentaion/screens/favourite_meals_screen.dart';
import '../../../meals/presentation/widgets/body_title.dart';
import 'recommend_meal_card.dart';
import '../cubit/recommendations_cubit.dart';
import '../screens/recommendation_screen.dart';

class RecommendedList extends StatefulWidget {
  const RecommendedList({Key? key}) : super(key: key);

  @override
  State<RecommendedList> createState() => _RecommendedListState();
}

class _RecommendedListState extends State<RecommendedList> {
  @override
  void initState() {
    RecommendationsCubit.get(context).getUserRecommendations(AuthCubit.get(context).userFavCountry, AuthCubit.get(context).userFavFoodType);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecommendationsCubit, RecommendationsState>(
      builder: (context, state) {
        return state is RecommendationsLoaded || state is RecommendationsLoading? Column(
          children: [
            BodyTitle(title: 'Recommendation', showSeeAll: true,onPressed: () {
             HomeCubit.get(context).selectAndNav(2);
            }),

            SizedBox(

              height: CustomResponsive.height( AppSizes.size200,  AppSizes.size100, context), // Adjust the height as needed
              child:state is RecommendationsLoaded? ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount:state.recommendations.length>10? 10:state.recommendations.length ,
                itemBuilder: (_, index) {
                  return  RecommendMealCard(meal: state.recommendations[index]);
                },
              ):const Center(child: CircularProgressIndicator(),),
            ),
          ],
        ):const SizedBox.shrink();
      },
    );
  }
}

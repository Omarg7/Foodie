import 'package:cooking_recipes/config/theme/presentation/theme_cubit/theme_cubit.dart';
import 'package:cooking_recipes/features/auth/presentation/cubit/auth/auth_cubit.dart';
import 'package:cooking_recipes/features/favourites/presentaion/cubit/favourites_cubit.dart';
import 'package:cooking_recipes/features/home/presentation/cubit/home_cubit.dart';
import 'package:cooking_recipes/features/meals/presentation/screens/meals_screen.dart';
import 'package:cooking_recipes/features/favourites/presentaion/screens/favourite_meals_screen.dart';
import 'package:cooking_recipes/features/recommendations/presentation/screens/random_meal_screen.dart';
import 'package:cooking_recipes/features/recommendations/presentation/screens/recommendation_screen.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/theme/app_color/app_color_light.dart';
import '../../../../core/utils/app_font_weights.dart';
import '../../../../config/localization/locale/app_localization.dart';
import '../../../../config/theme/app_color/app_color.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../core/utils/durations.dart';
import '../../../general/presentation/screens/general_user_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,

  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _pageController;

  @override
  initState() {
    FavouritesCubit.get(context).loadFav(AuthCubit.get(context).userId.toString());
    _pageController = PageController(initialPage: HomeCubit
        .get(context)
        .currentIndex);

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Theme
            .of(context)
            .appBarTheme
            .backgroundColor,
      ));
    return Scaffold(
      extendBody: true,

      bottomNavigationBar: BlocConsumer<HomeCubit, HomeScreenSelected>(
        listener: (context, state) {

          _pageController.animateToPage(state.index,
              duration: AnimationDuration.microAnimationDuration200,
              curve: Curves.easeIn);
        },
  builder: (context, state) {
    return FloatingNavbar(selectedBackgroundColor:Theme.of(context).colorScheme.background,
      backgroundColor: Theme.of(context).colorScheme.background,
unselectedItemColor: Colors.grey,
selectedItemColor:Theme.of(context).colorScheme.surface,

        onTap: (int val) {
          HomeCubit.get(context).selectAndNav(val);

    },
    currentIndex: state.index,
    items: [
    FloatingNavbarItem(icon: Icons.home, title: AppLocalizations.of(context)!.translate(AppStrings.homeText)),
    FloatingNavbarItem(icon: Icons.favorite, title: AppLocalizations.of(context)!.translate(AppStrings.favorites)),
    FloatingNavbarItem(icon: Icons.recommend, title: AppLocalizations.of(context)!.translate(AppStrings.recommendedText)),
    FloatingNavbarItem(icon: Icons.settings,title: AppLocalizations.of(context)!.translate(AppStrings.settings)),
    ],
    );
  },
),
      body: Stack(
        children: [
          PageView(

            onPageChanged: (index) {
              HomeCubit.get(context).selectAndNav(index);
            },
            controller: _pageController,
            children: const [
              MealsScreen(),
              FavouriteMealsScreen(),
              RecommendationScreen(),
              AppSettingsScreen()

            ],
          ),
       /*   Positioned(bottom:AppSizes.size0,
            right: (MediaQuery.sizeOf(context).width * .007).w,
            left: (MediaQuery.sizeOf(context).width * .007).w,
            child: BlocConsumer<HomeCubit, HomeScreenSelected>(
              listener: (context, state) {
                _pageController.animateToPage(state.index,
                    duration: AnimationDuration.microAnimationDuration200,
                    curve: Curves.easeIn);
              },
              builder: (context, state) {
                return Card(
                  color: Theme.of(context).colorScheme.background,
                  margin: const EdgeInsets.only(bottom: AppSizes.size2,left:AppSizes.size2,right:  AppSizes.size2 ),
                  child: Theme(data:Theme.of(context).copyWith(splashColor: AppColors.transparent,shadowColor:AppColors.transparent ) ,
                    child: *//*BottomNavigationBar(
                      type: BottomNavigationBarType.fixed,
                        backgroundColor: Theme.of(context).colorScheme.background,
                        selectedFontSize: AppSizes.fontSize14,
                        unselectedFontSize: AppSizes.fontSize12,
                        onTap: (index) {
                          HomeCubit.get(context).selectAndNav(index);

                        },

                        currentIndex: state.index,
                        items: [
                          BottomNavigationBarItem(
                       *//**//*     activeIcon: Container(decoration: BoxDecoration(border: Border(top: BorderSide(
                              color: state.index==0? Theme.of(context).colorScheme.surface:Theme.of(context).colorScheme.background
                            ))),child: const Icon(Icons.home)),*//**//*

                            label: AppLocalizations.of(context)!.translate(
                              AppStrings.homeText,),
                            icon: Container(decoration: BoxDecoration(border: Border(top: BorderSide(
                                color: state.index==0? Theme.of(context).colorScheme.surface:Theme.of(context).colorScheme.background
                            ))),child: const Icon(Icons.home)),
                          ),
                          BottomNavigationBarItem(
                            label: AppLocalizations.of(context)!.translate(
                              AppStrings.favorites,),
                            icon:  BlocBuilder<AuthCubit,AuthState>(
  builder: (context, state) {
    return Badge(label: Text(AuthCubit.get(context).currentUser.bookmarkedMeals.length.toString()),

                                child: const Icon(Icons.favorite));
  },
),
                          ),
                          BottomNavigationBarItem(
                            label: AppLocalizations.of(context)!.translate(
                                AppStrings.recommendedText),
                            icon: const Icon(Icons.recommend),
                          ),

                          BottomNavigationBarItem(
                            label: AppLocalizations.of(context)!.translate(
                                AppStrings.general),
                            icon: const Icon(Icons.settings),
                          ),
                        ])*//*,
                  ),
                );
              },
            ),
          )*/
        ],
      ),


    );
  }
}

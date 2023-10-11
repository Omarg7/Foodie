
import 'package:cooking_recipes/core/utils/app_sizes.dart';
import 'package:cooking_recipes/features/auth/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding/flutter_onboarding.dart';
import 'package:flutter_onboarding/onboarding_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/theme/app_color/app_color.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Here we are calling FlutterOnBoarding to show on our page
      body: Padding(padding: const EdgeInsets.only(top:AppSizes.marginSize20,left: AppSizes.paddingSize8,right: AppSizes.paddingSize8,bottom: AppSizes.paddingSize20),
        child: FlutterOnBoarding(
          inactiveIndicatorColor: AppColors.grey,
          activeIndicatorColor: Theme.of(context).primaryColor,
          backgroundColor:AppColors.white,
nextButtonColor: Theme.of(context).primaryColor,
          skipButtonTextStyle: Theme.of(context).textTheme.bodySmall!,
         imageHeight: AppSizes.size200.h,
          imageWidth: AppSizes.size150.w,
getStartedButtonDecoration: BoxDecoration(color: Theme.of(context).primaryColor,borderRadius: BorderRadius.circular(AppSizes.radius50),),getStartedButtonSize:Size(MediaQuery.sizeOf(context).width / 2, AppSizes.size50) ,getStartedButtonTextStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(color: AppColors.white),
          pages: [
            IntroModel(
              title: 'Discover Delicious Recipes',
              description:
              'Explore a world of mouthwatering dishes for every occasion',
              titleColor: Colors.black,
              descriptionColor: Colors.black87,
              imagePath: 'assets/images/onboarding1.gif',

            ),
            IntroModel(
              title: 'Personalize Your Preferences',
              description:
              'Tailor your recipe recommendations based on your dietary needs and taste preferences',
              titleColor: Colors.black,
              descriptionColor: Colors.black87,
              imagePath: 'assets/images/onboarding2.png',
            ),
            IntroModel(
              title: 'Save and Organize Favorites',
              description:
              'Keep track of your go-to recipes and create custom collections for easy access',
              titleColor: Colors.black,
              descriptionColor: Colors.black87,
              imagePath: 'assets/images/onboarding3.png',
            ),
          ],
          onGetStartedRoute: MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        ),
      ),
    );
  }
}
import 'package:cooking_recipes/core/utils/responsive_grid.dart';
import 'package:cooking_recipes/core/widgets/app_logo.dart';
import 'package:cooking_recipes/core/widgets/custom_sliver_app_bar.dart';
import 'package:cooking_recipes/core/widgets/input_form_field.dart';
import 'package:cooking_recipes/features/home/presentation/widgets/meals_filter_bottom_sheet.dart';
import 'package:cooking_recipes/features/meals/presentation/screens/search_screen.dart';
import 'package:cooking_recipes/features/meals/presentation/widgets/tabbar_header.dart';
import 'package:cooking_recipes/features/recommendations/presentation/widgets/recommended_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../config/localization/locale/app_localization.dart';
import '../../../../core/utils/utils.dart';

import '../widgets/meals_filtering_tabbar.dart';

import '../widgets/category_meals_grid.dart';

class MealsScreen extends StatefulWidget {
  const MealsScreen({super.key});

  @override
  State<MealsScreen> createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(appBar:


    AppBar(toolbarHeight: CustomResponsive.height(AppSizes.size65,AppSizes.size40, context),title: Container(color: Theme.of(context).colorScheme.background,width: MediaQuery.of(context).size.width,
            child: Row(mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Logo(radius: AppSizes.radius30.r,),
                const SizedBox(width: AppSizes.size20,),
                RichText(
                  softWrap: true,
                  text: TextSpan(
                    text: /*'Welcome ${AuthCubit.get(context).currentUser.name.split(" ")[0]}, in '*/'',
                    style: Theme.of(context).textTheme.displayMedium,
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Foodie',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                              color: Theme.of(context).primaryColor)),
                    ],
                  ),
                ),

              ],
            ),
          ),),
      extendBodyBehindAppBar: true,
      body: CustomScrollView(slivers: [
        CustomSliverAppBar(

          bgColor: Theme.of(context).colorScheme.background,
          customTitle:const SizedBox.shrink(),
          context: context, expandedHeight:CustomResponsive.height(490,  230, context), collapsedHeight:CustomResponsive.height( AppSizes.size40,  AppSizes.size20, context),
          appBarFlex:  Padding(
          padding: const EdgeInsets.all(AppSizes.paddingSize8),
          child: Column(

              children: [
                 SizedBox(height: CustomResponsive.height((kToolbarHeight+AppSizes.size30),AppSizes.size45,context ),),
                ListTile(tileColor: Theme.of(context).colorScheme.background,minLeadingWidth: 0,horizontalTitleGap: 0,contentPadding: EdgeInsets.zero,title: Text('What do you like to eat today?',style: Theme.of(context).textTheme.displayMedium,),),

              Stack(
                children: [
                  Hero(tag: 'field1',
                    child: GestureDetector(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchScreen(),));},
                      child: CustomFormField(enabled: false,

                          contentPadding: AppSizes.size10,prefixIcon: Icons.search,hintText: AppLocalizations.of(context)!.translate(
                              AppStrings.searchForRecipes), textEditingController: TextEditingController(), textInputType:TextInputType.text),
                    ),
                  ),
                  Positioned(right: AppSizes.size5,child: IconButton(onPressed: (){
                    showFilterSheet(customContext: context);
                  }, icon:  const Icon(Icons.tune_outlined)),),

                ],
              ),

                const RecommendedList(),
                MediaQuery.sizeOf(context).height <850? SizedBox(): const TabBarHeader(),


            ],),
        ),
          appBarBottom: const TabBarListView(),
bottomHeight: CustomResponsive.height( AppSizes.size40,  AppSizes.size20, context),
        ),

const SliverToBoxAdapter(child: SizedBox(height: AppSizes.size5,),),


        const CategoryMealsGrid(),

        // Text('What would you like to cook today?',style: Theme.of(context).textTheme.displayLarge,),

      ],),
    );
  }
}
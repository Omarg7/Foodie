
import 'package:cooking_recipes/features/favourites/presentaion/cubit/favourites_cubit.dart';
import 'package:cooking_recipes/core/widgets/custom_icon_button.dart';
import 'package:cooking_recipes/features/favourites/presentaion/widgets/favourite_card.dart';
import 'package:cooking_recipes/features/favourites/presentaion/widgets/favourite_meal_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../core/utils/responsive_grid.dart';
import '../../../../core/utils/utils.dart';

class FavouriteMealsScreen extends StatefulWidget {
  const FavouriteMealsScreen({super.key});

  @override
  _FavouriteMealsScreenState createState() => new _FavouriteMealsScreenState();
}

class _FavouriteMealsScreenState extends State<FavouriteMealsScreen> {
  late PageController controller;

  @override
  initState() {
    controller = PageController(
      initialPage: 0,
      keepPage: false,
      viewportFraction: 0.8,
    );
  Future.delayed(const Duration(milliseconds: 500)).then((value) {
    setState(() {
      controller.animateToPage( FavouritesCubit.currentMealIndex,
          duration: const Duration(milliseconds: 500), curve: Curves.bounceIn);

    });
  });


    super.initState();
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(
            MediaQuery.sizeOf(context).width,
            CustomResponsive.height(AppSizes.size100,MediaQuery.sizeOf(context).height<360? AppSizes.size60:AppSizes.size30, context),
          ),
          child:Padding(
            padding: EdgeInsets.only(
                right: AppSizes.paddingSize16,
                left: AppSizes.paddingSize16,
                top: AppSizes.size60.h),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                    alignment: Alignment.bottomLeft,
                    child: BlocBuilder<FavouritesCubit, FavouritesLoaded>(
                      builder: (context, state) {
                        return RichText(
                          softWrap: true,
                          text: TextSpan(
                            text: 'FAVOURITE RECIPES',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
                                color: Theme.of(context).primaryColor),
                            children: <TextSpan>[
                              TextSpan(
                                  text:
                                  '\nThere are ${state.meals.length} saved recipes.',
                                  style:
                                  Theme.of(context).textTheme.displaySmall)
                            ],
                          ),
                        );
                      },
                    )),
                Align(alignment: Alignment.bottomRight,
                  child: RectangularIconButton(
                      borderColor: Colors.red.shade300,
                      icon: Icons.delete_forever,
                      onTap: () {},
                      size: AppSizes.size40,
                      iconColor: Theme.of(context).primaryColor,
                      backgroundColor:
                      Theme.of(context).colorScheme.background),
                )
              ],
            ),
          ),),
      body: Center(
        heightFactor: MediaQuery.sizeOf(context).height < AppSizes.size400
            ? 1
            : .9,
        child: BlocConsumer<FavouritesCubit, FavouritesState>(
          listenWhen: (previous, current) => current is FavouritesLoaded,
          listener: (context, state) {
            if(state is FavouritesLoaded && state.toastMessage!=null && state.toastMessage!.isNotEmpty){
              Fluttertoast.showToast(msg: state.toastMessage??'');
            }else{

            }

          },
          builder: (context, favState) {
           if(favState is FavouritesLoaded){
             return MediaQuery.sizeOf(context).height < AppSizes.size500
                 ? Container(
                 margin: const EdgeInsets.all(AppSizes.paddingSize10),
                 height: AppSizes.size300,
                 child: GridView.builder(
                   gridDelegate: CustomResponsive.grid(
                       MediaQuery.sizeOf(context).height,
                       MediaQuery.sizeOf(context).width),
                   itemCount: favState.meals.length,
                   itemBuilder: (context, index) {
                     return FavouriteCard(
                       meal: favState.meals[index],
                       subtitle: '',
                     );
                   },
                 ))
                 : PageView.builder(
                 itemCount: favState.meals.length,
                 onPageChanged: (value) {
                   FavouritesCubit.get(context).changeIndex(value);
                 },
                 controller: controller,
                 itemBuilder: (context, index) => FavouriteMealCard(
                     meal: favState.meals[index],
                     controller: controller,
                     index: index));
           }else{
             return const SizedBox();
           }
          },
        ),
      ),
    );
  }
}

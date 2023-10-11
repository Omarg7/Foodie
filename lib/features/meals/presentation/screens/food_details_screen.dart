import 'package:awesome_stepper/awesome_stepper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cooking_recipes/core/utils/app_font_weights.dart';
import 'package:cooking_recipes/core/utils/responsive_grid.dart';
import 'package:cooking_recipes/shared/domain/entity/meal_entity.dart';
import 'package:cooking_recipes/features/meals/presentation/cubit/meal_details/meal_details_cubit.dart';
import 'package:cooking_recipes/features/meals/presentation/screens/recipe_blog_screen.dart';
import 'package:cooking_recipes/features/meals/presentation/screens/recipe_video_screen.dart';
import 'package:cooking_recipes/core/widgets/custom_button.dart';
import 'package:cooking_recipes/core/widgets/favourite_button.dart';
import 'package:cooking_recipes/features/meals/presentation/widgets/ingredient_card.dart';
import 'package:cooking_recipes/features/meals/presentation/widgets/instructions_card.dart';
import 'package:cooking_recipes/features/meals/presentation/widgets/instructions_tile.dart';
import 'package:cooking_recipes/features/meals/presentation/widgets/meal_tags_list.dart';
import 'package:cooking_recipes/core/widgets/recipe_blog_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../../config/theme/presentation/theme_cubit/theme_cubit.dart';
import '../../../../core/utils/utils.dart';

import '../../../../config/theme/app_color/app_color.dart';
import '../../../../core/widgets/custom_icon_button.dart';
import '../../../../core/widgets/youtube_button.dart';

class FoodDetailsScreen extends StatefulWidget {
  FoodDetailsScreen({Key? key}) : super(key: key);

  @override
  State<FoodDetailsScreen> createState() => _FoodDetailsScreenState();
}

class _FoodDetailsScreenState extends State<FoodDetailsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            BlocBuilder<MealDetailsCubit, MealDetailsState>(
              builder: (context, state) {
                return CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * .42,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              right: 0,
                              child: Hero(
                                tag: 'ItemaaaaaaImage',
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * .4,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: CachedNetworkImageProvider(state
                                              is MealDetailsLoaded
                                          ? state.meal.thumbnail
                                          : 'https://t4.ftcdn.net/jpg/04/00/24/31/360_F_400243185_BOxON3h9avMUX10RsDkt3pJ8iQx72kS3.jpg'),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 20,
                              left: 15,
                              right: 15,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomIconButton(
                                    iconSize: 25.r,
                                    boxShape: BoxShape.circle,
                                    size: 35.r,
                                    iconColor:ThemeCubit.get(context).isDark? AppColors.white:AppColors.black,
                                    icon: Icons.arrow_back,
                                    backgroundColor: Theme
                    .of(context)
                    .colorScheme
                    .background,
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  FavouriteButton(meal:state is MealDetailsLoaded? state.meal:MealEntity(mealId: -1, name: 'name', category: 'category', area: 'area', instructions: ['instructions'], thumbnail: 'thumbnail', tags: ['tags'], youtubeLink: 'youtubeLink', ingredients: ['ingredients'], measures: ['measures'], recipeLink: 'recipeLink')),
                                ],
                              ),
                            ),
                            /* Positioned(
                          top: MediaQuery.of(context).size.height * .38,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: AppSizes.size10,
                            decoration:  BoxDecoration(
                              color: Theme.of(context).colorScheme.background,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(AppSizes.radius100),
                                  topRight: Radius.circular(AppSizes.radius100)),
                            ),
                          ),
                        ),
*/
                            // FoodImage(mealImageUrl: state.meal.mealImageUrl),
                            // FoodDetails(meal: state.meal),
                          ],
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppSizes.paddingSize14),
                        decoration: BoxDecoration(
                              /*,borderRadius: BorderRadius.circular(AppSizes.radius100)*/),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    state is MealDetailsLoaded
                                        ? state.meal.name
                                        : '',
                                    softWrap: true,
                                    style: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  minLeadingWidth: -10,
                                  leading: const Icon(
                                    Icons.restaurant,
                                    color: AppColors.blueGrey,
                                  ),
                                  title: Text(
                                      state is MealDetailsLoaded
                                          ? state.meal.category
                                          : '',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5),
                                )),
                                Expanded(
                                    child: ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  minLeadingWidth: -10,
                                  leading: const Icon(
                                    Icons.location_on,
                                    color: AppColors.red,
                                  ),
                                  title: Text(
                                    state is MealDetailsLoaded
                                        ? state.meal.area
                                        : '',
                                    style:
                                        Theme.of(context).textTheme.headline5,
                                  ),
                                )),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Tags:  ',
                                  style: Theme.of(context).textTheme.headline5,
                                ),
                                MealTagsList(tags:state is MealDetailsLoaded ? state.meal.tags:[]),
                              ],
                            ),
                            const SizedBox(
                              height: AppSizes.size10,
                            ),
                            Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Ingredients',
                                  style: Theme.of(context).textTheme.headline2,
                                ),
                                Text(
                                    '${state is MealDetailsLoaded ? state.meal.ingredients.length : 0} Items'),
                              ],
                            ),
                            const SizedBox(
                              height: AppSizes.size10,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverGrid.builder(
                        itemCount: state is MealDetailsLoaded
                            ? state.meal.ingredients.length
                            : 0,
                        itemBuilder: (context, index) => IngredientCard(
                              title: state is MealDetailsLoaded
                                  ? state.meal.ingredients[index]
                                  : '',
                              measure: state is MealDetailsLoaded
                                  ? state.meal.measures[index]
                                  : '',
                            ),
                        gridDelegate:
                            CustomResponsive.ingredientsGrid(MediaQuery.sizeOf(context).height, MediaQuery.sizeOf(context).width)),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppSizes.paddingSize16,
                            vertical: AppSizes.paddingSize5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Divider(),
                            const SizedBox(
                              height: AppSizes.size10,
                            ),
                            state is MealDetailsLoaded
                                ? InstructionsCard(
                                    instructions: state.meal.instructions)
                                : SizedBox(),
                            SizedBox(
                              height: AppSizes.size60.h,
                            ),

                            /*    Row(
                          children: [
                            Expanded(child: Text('For the delicious recipe details, simply click on the following link',style: Theme.of(context).textTheme.bodyMedium,)),
                            TextButton(onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return RecipeBlogScreen(url: state.meal.recipeLink,);
                              },));
                            }, child: const Text('link',style: Theme.,)),
                          ],
                        ),
                        const SizedBox(
                          height: AppSizes.size40,
                        ),*/
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            Positioned(bottom: AppSizes.size0,
              child: BlocBuilder<MealDetailsCubit, MealDetailsState>(
                builder: (context, state) {
                  return ButtonBar(
                    buttonHeight: AppSizes.size40.h,
                    children: [
                      BlogButton(blogLink: state is MealDetailsLoaded
                          ? state.meal.recipeLink
                          : '',
                          ),
                      YoutubeButton(instructions: state is MealDetailsLoaded
                          ? state.meal.instructions
                          : [],videoLink: state is MealDetailsLoaded
                          ? state.meal.youtubeLink
                          : '',
                         ),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

// Row(
//   children: [
//     Container(
//       width: 120,
//       height: 50,
//       padding: EdgeInsets.all(5),
//       decoration: BoxDecoration(
//         color: Colors.amber,
//         borderRadius: BorderRadius.circular(15),
//       ),
//       child: Row(
//         mainAxisAlignment:
//             MainAxisAlignment.spaceEvenly,
//         children: [
//           GestureDetector(
//             onTap: () {
//               setState(() {
//                 _quantity -= 1;
//                 _total -= prices[selectedIndex];
//               });
//             },
//             child: Text(
//               '-',
//               style: TextStyle(fontSize: 20),
//             ),
//           ),
//           Container(
//             width: 50,
//             height: 50,
//             padding: EdgeInsets.all(2),
//             decoration: BoxDecoration(
//                 borderRadius:
//                     BorderRadius.circular(15),
//                 shape: BoxShape.rectangle,
//                 color: Colors.white),
//             child: Center(
//               child: Text(
//                 _quantity.toString(),
//                 style: TextStyle(
//                   fontSize: 20,
//                   color: Colors.black,
//                 ),
//               ),
//             ),
//           ),
//           GestureDetector(
//             onTap: () {
//               setState(() {
//                 _quantity += 1;
//                 _total += prices[selectedIndex];
//               });
//             },
//             child: Text(
//               '+',
//               style: TextStyle(fontSize: 20),
//             ),
//           ),
//         ],
//       ),
//     ),
//   ],
// ),
// + - items
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// RectangularIconButton(
// icon: Icons.remove,
// onTap: () {
// setState(() {
// _quantity -= 1;
// });
// },
// size: 40,
// iconColor: Colors.black,
// backgroundColor: Colors.white,
// ),
// SizedBox(
// width: 10,
// ),
// Text(
// _quantity.toString(),
// style: TextStyle(
// fontWeight: FontWeight.bold,
// fontSize: 18),
// ),
// SizedBox(
// width: 10,
// ),
// RectangularIconButton(
// icon: Icons.add,
// onTap: () {
// setState(() {
// _quantity += 1;
// });
// },
// size: 40,
// iconColor: Colors.black,
// backgroundColor: Colors.amberAccent),
// ],
// )

// extras
//Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: List.generate(
//                               state.meal.toppings.length,
//                               (index) => Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Container(
//                                         width: 20,
//                                         height: 20,
//                                         child: Icon(
//                                           widget
//                                               .meal.toppings[index].toppingIcon,
//                                           color: Colors.deepOrange,
//                                           size: 16,
//                                         ),
//                                       ),
//                                       Text(
//                                         widget
//                                             .meal.toppings[index].toppingTitle,
//                                       ),
//                                       SizedBox(
//                                         width: 10,
//                                       ),
//                                       Text(
//                                         state.meal.toppings[index].toppingPrice
//                                                 .toString() +
//                                             ' EGP',
//                                       ),
//                                       SizedBox(
//                                         width: 30,
//                                       ),
//                                       Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           RectangularIconButton(
//                                             icon: Icons.remove,
//                                             onTap: () {
//                                               setState(() {
//                                                 _quantity -= 1;
//                                               });
//                                             },
//                                             size: 40,
//                                             iconColor: Colors.black,
//                                             backgroundColor: Colors.white,
//                                           ),
//                                           SizedBox(
//                                             width: 10,
//                                           ),
//                                           Text(
//                                             _quantity.toString(),
//                                             style: TextStyle(
//                                                 fontWeight: FontWeight.bold,
//                                                 fontSize: 18),
//                                           ),
//                                           SizedBox(
//                                             width: 10,
//                                           ),
//                                           RectangularIconButton(
//                                               icon: Icons.add,
//                                               onTap: () {
//                                                 setState(() {
//                                                   _quantity += 1;
//                                                 });
//                                               },
//                                               size: 40,
//                                               iconColor: Colors.black,
//                                               backgroundColor: Colors.white),
//                                         ],
//                                       ),
//                                     ],
//                                   )),
//                         ),

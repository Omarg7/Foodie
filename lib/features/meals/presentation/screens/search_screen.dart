import 'package:cached_network_image/cached_network_image.dart';
import 'package:cooking_recipes/core/widgets/custom_app_bar.dart';
import 'package:cooking_recipes/features/meals/presentation/cubit/meals_search/meals_search_cubit.dart';
import 'package:cooking_recipes/features/meals/presentation/widgets/meals_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/utils.dart';

import '../../../../core/utils/app_font_weights.dart';
import '../../../../config/localization/locale/app_localization.dart';
import '../../../../config/theme/app_color/app_color.dart';
import '../../../../core/widgets/input_form_field.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final TextEditingController _searchFieldController;

  void initState() {
    _searchFieldController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _searchFieldController.clear();
    _searchFieldController.dispose();

    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(AppSizes.paddingSize8),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(height: AppSizes.size40.h,),
            ),
            SliverToBoxAdapter(
              child:BlocBuilder<MealsSearchCubit, MealsSearchState>(
                builder: (context, state) {
                  return Hero(tag: 'field1',
                    child: SizedBox(height: AppSizes.size50,
                      child: CustomField(
                          prefixIcon: _searchFieldController.text.isEmpty ? Icons
                              .arrow_back_rounded : Icons.search,
                          contentPadding: AppSizes.size20,
                          prefixIconOnPressed: _searchFieldController.text.isEmpty ? () {
                            Navigator.pop(context);
                          } : null,
                          suffixIcon: Icons.clear,
                          suffixIconOnPressed: () {
                            _searchFieldController.text = '';
                            MealsSearchCubit.get(context)
                                .clearSearched();
                          },
                          hintText: AppLocalizations.of(context)!.translate(
                              AppStrings.searchForRecipes),
                          onChanged: (_) {
                            MealsSearchCubit.get(context)
                                .search(_searchFieldController.text);
                          },
                          validator: (val) {
                            return val!;
                          },
                          onSaved: (val) {},
                          obscureText: false,
                          textEditingController: _searchFieldController,
                          textInputType: TextInputType.text),
                    ),
                  );
                },
              ) ,
            ),
            BlocBuilder<MealsSearchCubit, MealsSearchState>(
                builder: (context, state) {
                  if (state is MealsSearchLoaded) {
                    return MealsGrid(meals: state.meals);
                  }
                  if (state is MealsSearchEmpty) {
                    return SliverToBoxAdapter(
                      child: Center(
                        child: Image(
                          fit: BoxFit.cover,
                          height: AppSizes.size150.h,
                          width: AppSizes.size200.w,
                          image: const AssetImage('assets/images/empty.PNG'),
                        ),
                      ),
                    );
                  } else if (state is MealsSearchLoading) {
                    return const SliverToBoxAdapter(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else if (state is MealsSearchError) {
                    return SliverToBoxAdapter(
                      child: Align(
                        alignment: const Alignment(300, 200),
                        child: Container(
                          width: 400,
                          height: 400,
                          color: AppColors.red,
                        ),
                      ),
                    );
                  } else {
                    return const SliverToBoxAdapter(
                      child: Center(
                        child: SizedBox(),
                      ),
                    );
                  }
                })
          ],
        ),
      ),
    );
  }
}

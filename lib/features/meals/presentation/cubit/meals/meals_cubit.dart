import 'package:bloc/bloc.dart';
import 'package:cooking_recipes/features/meals/domain/use_case/filter_meals_by_main_ingredient_use_case.dart';
import 'package:cooking_recipes/features/meals/presentation/cubit/meals_filtering/meals_filtering_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../shared/domain/entity/meal_entity.dart';
import '../../../../../shared/domain/use_case/filter_meals_by_area_use_case.dart';
import '../../../../../shared/domain/use_case/filter_meals_by_category_use_case.dart';

part 'meals_state.dart';

class MealsCubit extends Cubit<MealsState> {
  MealsCubit(this._mealsByCategoryUseCase, this._mealsByAreaUseCase,
      this._mealsByIngredientUseCase)
      : super(MealsInitial());
  FilterMealsByCategoryUseCase _mealsByCategoryUseCase;
  FilterMealsByAreaUseCase _mealsByAreaUseCase;
  FilterMealsByIngredientUseCase _mealsByIngredientUseCase;
  static MealsCubit get(context) => BlocProvider.of(context);
  List<MealEntity> meals = [];
  loadMeals(FilterOption selectedFilterOption, String selected) {

    selectedFilterOption == FilterOption.categories
        ? {_loadMealsByCategory(selected)}
        : selectedFilterOption == FilterOption.countries
            ? {_loadMealsByArea(selected)}
            : {_loadMealsByIngredient(selected)};
  }

  _loadMealsByCategory(String category) async {
    try {
      emit(MealsLoading());
      final data = await _mealsByCategoryUseCase.call(category);
      data.fold((l) {
        emit(MealsError(error: l.message));
      }, (r) {
        r.isEmpty
            ? {
                emit(MealsEmpty()),
              }
            : {
                meals = r,
                emit(MealsLoaded(meals: meals)),
              };
      });
    } catch (e) {
      emit(MealsError(error: e.toString()));
    }
  }

  _loadMealsByArea(String area) async {
    try {

      emit(MealsLoading());
      final data = await _mealsByAreaUseCase.call(area);
      data.fold((l) {
        emit(MealsError(error: l.message));
      }, (r) {
        r.isEmpty
            ? {
                emit(MealsEmpty()),
              }
            : {
                meals = r,
                emit(MealsLoaded(meals: meals)),
              };
      });
    } catch (e) {
      emit(MealsError(error: e.toString()));
    }
  }

  _loadMealsByIngredient(String ingredient) async {
    try {

      emit(MealsLoading());
      final data = await _mealsByIngredientUseCase.call(ingredient);
      data.fold((l) {
        emit(MealsError(error: l.message));
      }, (r) {
        r.isEmpty
            ? {
                emit(MealsEmpty()),
              }
            : {
                meals = r,
                emit(MealsLoaded(
                  meals: meals,
                )),
              };
      });
    } catch (e) {
      emit(MealsError(error: e.toString()));
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:cooking_recipes/core/use_case/base_use_case.dart';
import 'package:cooking_recipes/features/recommendations/domain/use_case/get_random_meal_use_case.dart';
import 'package:cooking_recipes/shared/data/model/meal_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../shared/domain/entity/meal_entity.dart';
import '../../../../shared/domain/use_case/filter_meals_by_area_use_case.dart';
import '../../../../shared/domain/use_case/filter_meals_by_category_use_case.dart';

part 'recommendations_state.dart';

class RecommendationsCubit extends Cubit<RecommendationsState> {
  RecommendationsCubit(this._randomMealUseCase,this._mealsByAreaUseCase,this._mealsByCategoryUseCase) : super(RecommendationsInitial());
static RecommendationsCubit get(context) =>BlocProvider.of(context);
  GetRandomMealUseCase _randomMealUseCase;
  FilterMealsByCategoryUseCase _mealsByCategoryUseCase;

  List<MealEntity> recommendations=[];

  FilterMealsByAreaUseCase _mealsByAreaUseCase;
  MealEntity? randomMeal;
 Future<MealEntity> getRandomMeal()async{
       if(randomMeal!=null){
         return randomMeal??MealModel.emptyResponse();

    }else{
         emit(RecommendationsLoading());
         final res = await _randomMealUseCase.call(NoParameters());

         randomMeal = res.fold((l) {
           return MealModel.emptyResponse();
         }, (r) {
           return r;
         });
         return randomMeal??MealModel.emptyResponse();
       }

  }
  getUserRecommendations(String favFoodArea,String favFoodCategory)async{
    if(recommendations.isEmpty){
      try {
        emit(RecommendationsLoading());
        List<MealEntity> countryMeals =
            await getAreaRecommendationRecipes(favFoodArea);
        List<MealEntity> categoryMeals =
            await getCategoryRecommendationRecipes(favFoodCategory);
        recommendations = countryMeals + categoryMeals;
        recommendations.isEmpty
            ? emit(RecommendationsEmpty())
            : emit(RecommendationsLoaded(recommendations: recommendations));
      } catch (e) {
        emit(RecommendationsError(error: e.toString()));
      }
    }else{
      emit(RecommendationsLoaded(recommendations: recommendations));
    }
  }
 Future<List<MealEntity>> getAreaRecommendationRecipes(String favFoodArea)async{


      final res=await _mealsByAreaUseCase.call(favFoodArea);
      return  res.fold((l) {
        throw l;
      }, (r) {
        return r;

      });

  }
  Future<List<MealEntity>>  getCategoryRecommendationRecipes(String favFoodCategory)async{



      final res = await _mealsByCategoryUseCase.call(favFoodCategory);
    return  res.fold((l) {
      throw l;
      }, (r) {
       return r;

      });

  }


}

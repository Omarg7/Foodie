
import 'package:dartz/dartz.dart';

import '../../../core/failure/failure.dart';
import '../model/meal_model.dart';

abstract class BaseServices{


  Future<Either<Failure,List<MealModel>>> filterMealsByArea(String area);
  Future<Either<Failure,List<MealModel>>> filterMealsByCategory(String category);
  Future<Either<Failure,List<MealModel>>> filterMealsByFirstLetter(String firstLetter);
  Future<Either<Failure,List<MealModel>>> filterMealsByIngredient(String ingredient);
  Future<Either<Failure,MealModel>> getMealById(String id);
  Future<Either<Failure,List<MealModel>>> getMealsByName(String name);



}
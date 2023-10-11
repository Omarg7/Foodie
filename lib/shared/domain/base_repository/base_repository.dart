import 'package:cooking_recipes/core/failure/failure.dart';
import 'package:cooking_recipes/shared/domain/entity/meal_entity.dart';
import 'package:dartz/dartz.dart';


abstract class BaseRepository{


  Future<Either<Failure,List<MealEntity>>> filterMealsByArea(String area);
  Future<Either<Failure,List<MealEntity>>> filterMealsByCategory(String category);
  Future<Either<Failure,List<MealEntity>>> filterMealsByFirstLetter(String firstLetter);
  Future<Either<Failure,List<MealEntity>>> filterMealsByIngredient(String ingredient);
  Future<Either<Failure,MealEntity>> getMealById(String id);
  Future<Either<Failure,List<MealEntity>>> getMealsByName(String name);




}
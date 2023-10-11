import 'package:cooking_recipes/core/failure/failure.dart';
import 'package:cooking_recipes/features/areas/domain/entity/area_entity.dart';
import 'package:cooking_recipes/features/ingredients/domain/entity/ingredient_entity.dart';
import 'package:cooking_recipes/shared/domain/entity/meal_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../categories/domain/entity/category_entity.dart';

abstract class BaseMealsRepository{


Future<Either<Failure,List<MealEntity>>> filterMealsByArea(String area);
Future<Either<Failure,List<MealEntity>>> filterMealsByCategory(String category);
Future<Either<Failure,List<MealEntity>>> filterMealsByFirstLetter(String firstLetter);
Future<Either<Failure,List<MealEntity>>> filterMealsByIngredient(String ingredient);
Future<Either<Failure,MealEntity>> getMealById(String id);
Future<Either<Failure,List<MealEntity>>> getMealsByName(String name);




}
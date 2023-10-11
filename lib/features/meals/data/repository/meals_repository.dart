import 'package:cooking_recipes/core/failure/failure.dart';
import 'package:cooking_recipes/shared/data/services/remote_services_impl.dart';
import 'package:cooking_recipes/features/meals/domain/base_repository/meals_base_repository.dart';
import 'package:cooking_recipes/features/areas/domain/entity/area_entity.dart';
import 'package:cooking_recipes/features/categories/domain/entity/category_entity.dart';
import 'package:cooking_recipes/features/ingredients/domain/entity/ingredient_entity.dart';
import 'package:cooking_recipes/shared/domain/entity/meal_entity.dart';
import 'package:dartz/dartz.dart';

class MealsRepository  extends BaseMealsRepository{
 final RemoteServicesImpl _remoteMealsServices;
  MealsRepository(this._remoteMealsServices);
  @override
  Future<Either<Failure, List<MealEntity>>> filterMealsByArea(String area) async =>await _remoteMealsServices.filterMealsByArea(area);

  @override
  Future<Either<Failure, List<MealEntity>>> filterMealsByCategory(String category) async =>await _remoteMealsServices.filterMealsByCategory(category);

  @override
  Future<Either<Failure, List<MealEntity>>> filterMealsByFirstLetter(String firstLetter) async =>await _remoteMealsServices.filterMealsByFirstLetter(firstLetter);

  @override
  Future<Either<Failure, List<MealEntity>>> filterMealsByIngredient(String ingredient) async =>await _remoteMealsServices.filterMealsByIngredient(ingredient);


  @override
  Future<Either<Failure, MealEntity>> getMealById(String id) async =>await _remoteMealsServices.getMealById(id);

  @override
  Future<Either<Failure, List<MealEntity>>> getMealsByName(String name) {
    // TODO: implement getMealsByName
    throw UnimplementedError();
  }



}
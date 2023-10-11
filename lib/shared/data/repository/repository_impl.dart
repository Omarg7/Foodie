import 'package:cooking_recipes/core/failure/failure.dart';
import 'package:cooking_recipes/shared/data/services/remote_services_impl.dart';

import 'package:cooking_recipes/shared/domain/base_repository/base_repository.dart';
import 'package:cooking_recipes/shared/domain/entity/meal_entity.dart';
import 'package:dartz/dartz.dart';

class BaseRepositoryImpl  extends BaseRepository{
  final RemoteServicesImpl _remoteMealsServices;
  BaseRepositoryImpl(this._remoteMealsServices);
  @override
  Future<Either<Failure, List<MealEntity>>> filterMealsByArea(String area) {
    // TODO: implement filterMealsByArea
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<MealEntity>>> filterMealsByCategory(String category) async =>await _remoteMealsServices.filterMealsByCategory(category);

  @override
  Future<Either<Failure, List<MealEntity>>> filterMealsByFirstLetter(String firstLetter) {
    // TODO: implement filterMealsByFirstLetter
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<MealEntity>>> filterMealsByIngredient(String ingredient) {
    // TODO: implement filterMealsByIngredient
    throw UnimplementedError();
  }


  @override
  Future<Either<Failure, MealEntity>> getMealById(String id) async =>await _remoteMealsServices.getMealById(id);

  @override
  Future<Either<Failure, List<MealEntity>>> getMealsByName(String name) {
    // TODO: implement getMealsByName
    throw UnimplementedError();
  }




}
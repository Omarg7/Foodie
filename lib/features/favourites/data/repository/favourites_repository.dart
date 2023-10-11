import 'package:cooking_recipes/core/failure/failure.dart';
import 'package:cooking_recipes/core/use_case/base_use_case.dart';
import 'package:cooking_recipes/features/favourites/domain/use_case/add_favourite_meal_use_case.dart';
import 'package:cooking_recipes/features/favourites/domain/use_case/favourites_use_case.dart';
import 'package:cooking_recipes/shared/data/model/meal_model.dart';

import 'package:cooking_recipes/shared/domain/entity/meal_entity.dart';
import 'package:dartz/dartz.dart';

import '../../domain/base_repository/base_favourites_repository.dart';
import '../services/local_favourites_services.dart';

class FavouritesRepository  extends BaseFavouritesRepository{
  LocalFavouritesServices _localFavouritesServices;
  FavouritesRepository(this._localFavouritesServices);

  @override
  Future<Either<Failure, bool>> addFavouriteMeal(AddFavouriteItemParameter parameter) async => await _localFavouritesServices.addFavouriteMeal(parameter);

  @override
  Future<Either<Failure, bool>> clearAllFavourites(String username) async => await _localFavouritesServices.clearAllFavourites(username);

  @override
  Future<Either<Failure, List<MealEntity>>> getFavourites(String username) async {
    List<MealEntity> meals=[];
   final res= await _localFavouritesServices.getFavourites(username);
   res.fold((l) {
     return Left(l);
   }, (r) {
     for (var element in r) {
       MealEntity meal=element.toMealEntity();
       meals.add(meal);
     }
return Right(meals);
   });
    return Right(meals);
  }

  @override
  Future<Either<Failure, bool>> removeFavouriteMeal(RemoveFavouriteMealParameter parameter) async => await _localFavouritesServices.removeFavouriteMeal(parameter);


}
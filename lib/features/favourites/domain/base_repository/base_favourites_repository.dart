import 'package:cooking_recipes/core/failure/failure.dart';
import 'package:cooking_recipes/features/favourites/domain/use_case/add_favourite_meal_use_case.dart';
import 'package:cooking_recipes/features/favourites/domain/use_case/favourites_use_case.dart';

import 'package:cooking_recipes/shared/domain/entity/meal_entity.dart';
import 'package:dartz/dartz.dart';

abstract class BaseFavouritesRepository{




  Future<Either<Failure,List<MealEntity>>> getFavourites(String uid);
  Future<Either<Failure,bool>> addFavouriteMeal(AddFavouriteItemParameter parameter);
  Future<Either<Failure,bool>> removeFavouriteMeal(RemoveFavouriteMealParameter parameter);
  Future<Either<Failure,bool>> clearAllFavourites(String uid);




}
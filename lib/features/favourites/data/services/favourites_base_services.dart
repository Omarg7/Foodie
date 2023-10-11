
import 'package:cooking_recipes/features/favourites/domain/use_case/favourites_use_case.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../../../../shared/data/model/meal_model.dart';
import '../model/favourite_model.dart';


abstract class BaseFavouritesServices{
  Future<Either<Failure, bool>> addFavouriteMeal(AddFavouriteItemParameter meal);
  Future<Either<Failure, bool>> removeFavouriteMeal(RemoveFavouriteMealParameter id);
  Future<Either<Failure, List<FavouriteModel>>> getFavourites(String username);
  Future<Either<Failure, bool>> clearAllFavourites(String username);


}
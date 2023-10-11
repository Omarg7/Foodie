import 'package:cooking_recipes/features/favourites/domain/use_case/add_favourite_meal_use_case.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:cooking_recipes/features/categories/data/services/categories_base_services.dart';
import 'package:cooking_recipes/shared/data/model/meal_model.dart';
import 'package:cooking_recipes/features/favourites/data/services/favourites_base_services.dart';
import 'package:dartz/dartz.dart';
import '../model/favourite_model.dart';

import '../../../../core/failure/failure.dart';
import '../../domain/use_case/favourites_use_case.dart';

class LocalFavouritesServices implements BaseFavouritesServices{

  static Box<FavouriteModel> hiveBox(String username) => Hive.box<FavouriteModel>('favourites');








  @override
  Future<Either<Failure, bool>> addFavouriteMeal(AddFavouriteItemParameter parameter) async{
    try{
      final box = hiveBox(parameter.username);

      FavouriteModel meal=FavouriteModel.fromME(parameter.meal,parameter.username);
      await box.add(meal);
      return const Right(true);
    }catch(e){

      return Left(ServiceFailure(e.toString()));
    }
  }


  @override
  Future<Either<Failure, bool>> clearAllFavourites(String username) async{
    try{

      final box = hiveBox(username);
    final userFav=   box.values.where((element) => element.uid==username).toList();
    for(FavouriteModel fav in userFav){
     await box.delete(fav.key);
    }
    return const Right(true);
    }catch(e){

      return  Left(ServiceFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<FavouriteModel>>> getFavourites(String username) async{
    try{


      final items = hiveBox(username)
          .values.where((element) => element.uid==username).toList().cast<FavouriteModel>();

      return Right(items.toList());
    }catch(e){
      return  Left(ServiceFailure(e.toString()));
    }

  }

  @override
  Future<Either<Failure, bool>> removeFavouriteMeal(RemoveFavouriteMealParameter parameter)async {
    try{
      final box = hiveBox(parameter.username);

      final itemToRemove = box.values.firstWhere((element) =>
      element.mealId == parameter.mealId );
      await itemToRemove.delete();
      return const Right(true);
    }catch(e){
      return Left(ServiceFailure(e.toString()));
    }
  }










}
import 'package:cooking_recipes/features/favourites/domain/base_repository/base_favourites_repository.dart';
import 'package:cooking_recipes/shared/data/model/meal_model.dart';
import 'package:cooking_recipes/shared/domain/entity/meal_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/use_case/base_use_case.dart';




class AddFavouriteMealUseCase extends BaseFutureUseCase<bool, AddFavouriteItemParameter> {
  final BaseFavouritesRepository _favouritesRepository;

  AddFavouriteMealUseCase(this._favouritesRepository);

  @override
  Future<Either<Failure, bool>> call(AddFavouriteItemParameter parameters) async
  => await _favouritesRepository.addFavouriteMeal(parameters);

}

class AddFavouriteItemParameter  {
  final MealEntity meal;
  final String username;
  const AddFavouriteItemParameter({
    required this.meal,
    required this.username,
  });


}
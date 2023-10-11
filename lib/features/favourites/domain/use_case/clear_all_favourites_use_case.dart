import 'package:cooking_recipes/features/favourites/domain/base_repository/base_favourites_repository.dart';
import 'package:cooking_recipes/shared/domain/entity/meal_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/use_case/base_use_case.dart';




class ClearFavouriteMealsUseCase extends BaseFutureUseCase<bool, String> {
  final BaseFavouritesRepository _favouritesRepository;

  ClearFavouriteMealsUseCase(this._favouritesRepository);

  @override
  Future<Either<Failure, bool>> call(String parameters) async
  => await _favouritesRepository.clearAllFavourites(parameters);

}


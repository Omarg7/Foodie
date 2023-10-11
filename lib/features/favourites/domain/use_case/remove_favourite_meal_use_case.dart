import 'package:cooking_recipes/features/favourites/domain/base_repository/base_favourites_repository.dart';
import 'package:cooking_recipes/shared/domain/entity/meal_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/use_case/base_use_case.dart';




class RemoveFavouriteMealUseCase extends BaseFutureUseCase<bool, RemoveFavouriteMealParameter> {
  final BaseFavouritesRepository _favouritesRepository;

  RemoveFavouriteMealUseCase(this._favouritesRepository);

  @override
  Future<Either<Failure, bool>> call(RemoveFavouriteMealParameter parameters) async
  => await _favouritesRepository.removeFavouriteMeal(parameters);

}
class RemoveFavouriteMealParameter  {
  final int mealId;
  final String username;
  const RemoveFavouriteMealParameter({
    required this.mealId,
    required this.username,
  });
}

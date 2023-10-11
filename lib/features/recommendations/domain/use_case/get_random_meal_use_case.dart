import 'package:cooking_recipes/features/categories/domain/entity/category_entity.dart';
import 'package:cooking_recipes/features/meals/domain/base_repository/meals_base_repository.dart';
import 'package:cooking_recipes/features/recommendations/domain/base_repository/recommendation_base_repository.dart';
import 'package:cooking_recipes/shared/domain/entity/meal_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/use_case/base_use_case.dart';





class GetRandomMealUseCase extends BaseFutureUseCase<MealEntity, NoParameters> {
  final BaseRecommendationRepository _recommendationRepository;

  GetRandomMealUseCase(this._recommendationRepository);

  @override
  Future<Either<Failure, MealEntity>> call(NoParameters parameters) async
  => await _recommendationRepository.getRandomMeal();

}


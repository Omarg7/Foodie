import 'package:cooking_recipes/features/categories/domain/entity/category_entity.dart';
import 'package:cooking_recipes/features/ingredients/domain/entity/ingredient_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/use_case/base_use_case.dart';

import '../repository/base_ingredient_repository.dart';



class GetIngredientsUseCase extends BaseFutureUseCase<List<IngredientEntity>, NoParameters> {
  final BaseIngredientsRepository _ingredientsRepository;

  GetIngredientsUseCase(this._ingredientsRepository);

  @override
  Future<Either<Failure, List<IngredientEntity>>> call(NoParameters parameters) async
  => await _ingredientsRepository.getIngredients(parameters);

}


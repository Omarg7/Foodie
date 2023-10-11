import 'package:cooking_recipes/core/use_case/base_use_case.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../entity/ingredient_entity.dart';

abstract class BaseIngredientsRepository{
  Future<Either<Failure,List<IngredientEntity>>> getIngredients(NoParameters parameters  );





}
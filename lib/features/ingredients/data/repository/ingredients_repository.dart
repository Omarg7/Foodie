import 'package:cooking_recipes/core/use_case/base_use_case.dart';
import 'package:cooking_recipes/features/categories/domain/entity/category_entity.dart';
import 'package:cooking_recipes/features/categories/domain/repository/base_category_repository.dart';
import 'package:cooking_recipes/features/ingredients/data/services/ingredients_base_services.dart';
import 'package:cooking_recipes/features/ingredients/data/services/remote/ingredients_remote_services.dart';
import 'package:cooking_recipes/features/ingredients/domain/entity/ingredient_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../../domain/repository/base_ingredient_repository.dart';

 class IngredientsRepository extends BaseIngredientsRepository{
   RemoteIngredientsServices _ingredientsServices;
   IngredientsRepository(this._ingredientsServices);
  @override
  Future<Either<Failure, List<IngredientEntity>>> getIngredients(NoParameters parameters) async=> await _ingredientsServices.getIngredients();








}
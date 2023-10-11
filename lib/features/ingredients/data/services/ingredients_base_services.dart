
import 'package:cooking_recipes/features/ingredients/data/model/ingredient_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';


abstract class BaseIngredientsServices{



  Future<Either<Failure,List<IngredientModel>>> getIngredients();



}
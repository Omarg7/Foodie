import 'package:cooking_recipes/core/failure/failure.dart';
import 'package:cooking_recipes/features/areas/domain/entity/area_entity.dart';
import 'package:cooking_recipes/features/ingredients/domain/entity/ingredient_entity.dart';
import 'package:cooking_recipes/shared/domain/entity/meal_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../categories/domain/entity/category_entity.dart';

abstract class BaseRecommendationRepository{

Future<Either<Failure,MealEntity>> getRandomMeal();




}
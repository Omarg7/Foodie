
import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../../../../shared/domain/entity/meal_entity.dart';


abstract class BaseRecommendationServices{



  Future<Either<Failure,MealEntity>> getRandomMeal();




}
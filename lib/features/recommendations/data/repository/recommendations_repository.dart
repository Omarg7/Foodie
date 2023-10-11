import 'package:cooking_recipes/core/use_case/base_use_case.dart';
import 'package:cooking_recipes/features/recommendations/data/services/remote/remote_recommendations_services.dart';
import 'package:cooking_recipes/shared/domain/base_repository/base_repository.dart';

import 'package:cooking_recipes/shared/domain/entity/meal_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/services/api_end_points.dart';
import '../../../../shared/data/model/meal_model.dart';
import '../../domain/base_repository/recommendation_base_repository.dart';

 class RecommendationRepository extends  BaseRecommendationRepository {
RecommendationRepository(this._recommendationsServices);
  final RemoteRecommendationsServices _recommendationsServices;
  @override
  Future<Either<Failure, MealEntity>> getRandomMeal() async => await _recommendationsServices.getRandomMeal();









}
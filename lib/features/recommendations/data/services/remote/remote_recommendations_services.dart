import 'package:cooking_recipes/shared/data/model/meal_model.dart';
import 'package:cooking_recipes/shared/data/services/remote_services_impl.dart';
import 'package:cooking_recipes/shared/domain/entity/meal_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../../core/failure/failure.dart';
import '../../../../../core/services/api_end_points.dart';
import '../../../../../shared/data/services/base_services.dart';
import '../base_recommendations_services.dart';

class RemoteRecommendationsServices extends BaseRecommendationServices{
  @override
  Future<Either<Failure, MealModel>> getRandomMeal() async{
    try {
      Dio dio=Dio();
      dio.options.baseUrl=APIHelper.baseUrl;

      dio.options.sendTimeout=const Duration(seconds: 10);

      Response response = await dio.get('${APIHelper.authKey}${APIHelper.randomMealEndPoint}');
      return RemoteServicesImpl.handleSingleMeal(response);

    } on DioException catch (e) {

      return Left(ServiceFailure(e.toString()));
    }
  }









}
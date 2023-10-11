import 'dart:convert';

import 'package:cooking_recipes/core/services/api_end_points.dart';
import 'package:cooking_recipes/features/areas/data/model/area_model.dart';
import 'package:cooking_recipes/features/categories/data/services/categories_base_services.dart';
import 'package:cooking_recipes/features/ingredients/data/model/ingredient_model.dart';
import 'package:cooking_recipes/shared/data/model/meal_model.dart';
import 'package:cooking_recipes/shared/data/services/base_services.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../core/failure/failure.dart';

class RemoteServicesImpl extends BaseServices {

  Either<Failure, List<MealModel>> handleResponse(Response response){
    final data;

    if (response.statusCode == 200 && response.data['meals']!=null ) {

      data = response.data['meals'];
      List<MealModel> meals=[];
      for (var element in data) {
        MealModel meal= MealModel.fromJson(element);
        meals.add(meal);
      }

      return Right(meals);
    } else {
      return Left(ServiceFailure(response.statusMessage ?? ''));
    }
}
 static Either<Failure, MealModel> handleSingleMeal(Response response){
    final data;
    try{
      if (response.statusCode == 200 && response.data['meals']!=null ) {
        data = response.data['meals'];
        List<MealModel> meals = [];
        for (var element in data) {
          MealModel meal = MealModel.fromJson(element);
          meals.add(meal);
        }
        return meals.isEmpty
            ? Right(MealModel.emptyResponse())
            : Right(meals.first);
      } else {
        return Left(ServiceFailure(response.statusMessage ?? ''));
      }

    }catch(e){
      return Left(ServiceFailure(e.toString()));
    }
  }
  @override
  Future<Either<Failure, List<MealModel>>> filterMealsByCategory(String category) async {

    try {
      Dio dio=Dio();
      dio.options.baseUrl=APIHelper.baseUrl;
      dio.options.queryParameters ={
        APIHelper.filterByCategoryParameterKey:category
      };
      dio.options.sendTimeout=const Duration(seconds: 10);


      Response response = await dio.get('${APIHelper.authKey}${APIHelper.filterByCategoryEndPoint}',);
      return handleResponse(response);
    } on DioException catch (e) {

      return Left(ServiceFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MealModel>>> filterMealsByArea(String area) async{
    try {


      Dio dio=Dio();
      dio.options.baseUrl=APIHelper.baseUrl;
      dio.options.queryParameters ={
        APIHelper.filterByAreaParameterKey:area
      };
      dio.options.sendTimeout=const Duration(seconds: 10);


      Response response = await dio.get('${APIHelper.authKey}${APIHelper.filterByAreaEndPoint}',);
      return handleResponse(response);
    } on DioException catch (e) {

      return Left(ServiceFailure(e.toString()));
    }
  }



  @override
  Future<Either<Failure, List<MealModel>>> filterMealsByFirstLetter(String firstLetter) async{
    try {
      Dio dio=Dio();
      dio.options.baseUrl=APIHelper.baseUrl;
      dio.options.queryParameters ={
        APIHelper.filterByFirstLetterParameterKey:firstLetter
      };
      dio.options.sendTimeout=const Duration(seconds: 10);

      Response response = await dio.get('${APIHelper.authKey}${APIHelper.filterByFirstLetterEndPoint}',);

      return handleResponse(response);
    } on DioException catch (e) {

      return Left(ServiceFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MealModel>>> filterMealsByIngredient(String ingredient) async{
    try {

      Dio dio=Dio();
      dio.options.baseUrl=APIHelper.baseUrl;
      dio.options.queryParameters ={
       APIHelper.filterByMainIngredientParameterKey:ingredient
      };

dio.options.sendTimeout=const Duration(seconds: 10);
      Response response = await dio.get('${APIHelper.authKey}${APIHelper.filterByMainIngredientEndPoint}');
      return handleResponse(response);
    } on DioException catch (e) {

      return Left(ServiceFailure(e.toString()));
    }
  }



  @override
  Future<Either<Failure, MealModel>> getMealById(String id) async{
    try {
      Dio dio=Dio();
      dio.options.baseUrl=APIHelper.baseUrl;
      dio.options.queryParameters ={
        APIHelper.mealByIDParameterKey:id
      };
      dio.options.sendTimeout=const Duration(seconds: 10);

      Response response = await dio.get('${APIHelper.authKey}${APIHelper.mealFullInfoEndPoint}');
 return handleSingleMeal(response);
    } on DioException catch (e) {

      return Left(ServiceFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MealModel>>> getMealsByName(String name)async {
    try {
      Dio dio=Dio();
      dio.options.baseUrl=APIHelper.baseUrl;
      dio.options.queryParameters ={
        APIHelper.searchByNameParameterKey:name
      };
      dio.options.sendTimeout=const Duration(seconds: 10);

      Response response = await dio.get('${APIHelper.authKey}${APIHelper.searchMealByNameEndPoint}');
return handleResponse(response);
    } on DioException catch (e) {

      return Left(ServiceFailure(e.toString()));
    }
  }



}
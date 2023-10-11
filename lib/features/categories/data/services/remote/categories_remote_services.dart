import 'dart:convert';

import 'package:cooking_recipes/core/services/api_end_points.dart';
import 'package:cooking_recipes/features/categories/data/services/categories_base_services.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../../core/failure/failure.dart';
import '../../model/category_model.dart';

class RemoteCategoriesServices extends BaseCategoriesServices {


  @override
  Future<Either<Failure, List<CategoryModel>>> getCategories() async {
    final data;
    try {


      final response = await Dio().get(APIHelper.baseUrl+APIHelper.authKey+APIHelper.categoriesEndPoint, options: Options(sendTimeout: Duration(seconds: 10)));
      if (response.statusCode == 200) {

        data = response.data['categories'];
  List<CategoryModel> categories=[];
        for (var element in data) {
          CategoryModel categoryModel= CategoryModel.fromJson(element);
          categories.add(categoryModel);
        }

        return Right(categories);
      } else {

        return Left(ServiceFailure(response.statusMessage ?? ''));
      }
    } on DioException catch (e) {

      return Left(ServiceFailure(e.toString()));
    }
  }
}
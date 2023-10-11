
import 'package:cooking_recipes/features/categories/data/model/category_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';


abstract class BaseCategoriesServices{



  Future<Either<Failure,List<CategoryModel>>> getCategories();



}
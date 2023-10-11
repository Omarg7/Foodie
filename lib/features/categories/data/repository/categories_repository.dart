import 'package:cooking_recipes/core/use_case/base_use_case.dart';
import 'package:cooking_recipes/features/categories/domain/entity/category_entity.dart';
import 'package:cooking_recipes/features/categories/domain/repository/base_category_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../model/category_model.dart';
import '../services/remote/categories_remote_services.dart';

 class CategoriesRepository extends BaseCategoriesRepository{
   RemoteCategoriesServices _remoteCategoriesServices;
   CategoriesRepository(this._remoteCategoriesServices);
  @override
  Future<Either<Failure, List<CategoryModel>>> getCategories(NoParameters parameters) async=> await _remoteCategoriesServices.getCategories();






}
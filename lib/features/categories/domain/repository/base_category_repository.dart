import 'package:cooking_recipes/core/use_case/base_use_case.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../entity/category_entity.dart';

abstract class BaseCategoriesRepository{
  Future<Either<Failure,List<CategoryEntity>>> getCategories(NoParameters parameters  );





}
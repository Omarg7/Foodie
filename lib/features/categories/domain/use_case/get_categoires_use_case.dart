import 'package:cooking_recipes/features/categories/domain/entity/category_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/use_case/base_use_case.dart';

import '../repository/base_category_repository.dart';



class GetCategoriesUseCase extends BaseFutureUseCase<List<CategoryEntity>, NoParameters> {
  final BaseCategoriesRepository _categoriesRepository;

  GetCategoriesUseCase(this._categoriesRepository);

  @override
  Future<Either<Failure, List<CategoryEntity>>> call(NoParameters parameters) async
  => await _categoriesRepository.getCategories(parameters);

}


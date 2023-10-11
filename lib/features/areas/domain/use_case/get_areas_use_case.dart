import 'package:cooking_recipes/features/categories/domain/entity/category_entity.dart';
import 'package:cooking_recipes/features/ingredients/domain/entity/ingredient_entity.dart';
import 'package:cooking_recipes/features/areas/domain/entity/area_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/use_case/base_use_case.dart';

import '../repository/base_areas_repository.dart';



class GetAreasUseCase extends BaseFutureUseCase<List<AreaEntity>, NoParameters> {
  final BaseAreaRepository _areaRepository;

  GetAreasUseCase(this._areaRepository);

  @override
  Future<Either<Failure, List<AreaEntity>>> call(NoParameters parameters) async
  => await _areaRepository.getAreas(parameters);

}


import 'package:cooking_recipes/core/use_case/base_use_case.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../entity/area_entity.dart';

abstract class BaseAreaRepository{
  Future<Either<Failure,List<AreaEntity>>> getAreas(NoParameters parameters  );





}
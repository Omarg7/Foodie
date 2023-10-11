import 'package:cooking_recipes/core/use_case/base_use_case.dart';
import 'package:cooking_recipes/features/areas/data/model/area_model.dart';
import 'package:cooking_recipes/features/areas/data/services/remote/areas_remote_services.dart';
import 'package:cooking_recipes/features/areas/domain/repository/base_areas_repository.dart';
import 'package:cooking_recipes/features/categories/domain/entity/category_entity.dart';
import 'package:cooking_recipes/features/categories/domain/repository/base_category_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';

 class AreasRepository extends BaseAreaRepository{

  final RemoteAreasServices _remoteAreasServices;
  AreasRepository(this._remoteAreasServices);
  @override
  Future<Either<Failure, List<AreaModel>>> getAreas(NoParameters parameters) async=> await _remoteAreasServices.getAreas();






}
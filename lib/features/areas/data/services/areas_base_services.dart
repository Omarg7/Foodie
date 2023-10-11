
import 'package:cooking_recipes/features/areas/data/model/area_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';


abstract class BaseAreasServices{



  Future<Either<Failure,List<AreaModel>>> getAreas();



}
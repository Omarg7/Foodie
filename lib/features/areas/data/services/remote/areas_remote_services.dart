import 'package:cooking_recipes/features/areas/data/model/area_model.dart';
import 'package:cooking_recipes/features/areas/data/services/areas_base_services.dart';
import 'package:cooking_recipes/features/ingredients/data/services/ingredients_base_services.dart';
import 'package:cooking_recipes/features/ingredients/data/model/ingredient_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../../core/failure/failure.dart';
import '../../../../../core/services/api_end_points.dart';

class RemoteAreasServices extends BaseAreasServices{


  @override
  Future<Either<Failure, List<AreaModel>>> getAreas() async{
    final data;
    try {
      Dio dio=Dio();
      dio.options.baseUrl=APIHelper.baseUrl;
      dio.options.queryParameters ={
        APIHelper.filterByAreaParameterKey:'list'
      };
      dio.options.sendTimeout=const Duration(seconds: 10);

      Response response = await dio.get('${APIHelper.authKey}${APIHelper.areasEndPoint}',);


      if (response.statusCode == 200) {

        data = response.data['meals'];

        List<AreaModel> areas=[];
        for (var element in data) {
          AreaModel area= AreaModel.fromJson(element);
          areas.add(area);
        }

        return Right(areas);
      } else {

        return Left(ServiceFailure(response.statusMessage ?? ''));
      }
    } on DioException catch (e) {

      return Left(ServiceFailure(e.toString()));
    }
  }






}
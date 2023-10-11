import 'package:bloc/bloc.dart';
import 'package:cooking_recipes/features/areas/domain/entity/area_entity.dart';
import 'package:cooking_recipes/features/areas/domain/use_case/get_areas_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/use_case/base_use_case.dart';

part 'areas_state.dart';

class AreasCubit extends Cubit<AreasState> {
  AreasCubit(this._getAreasUseCase) : super(AreasInitialState());
static AreasCubit get(context)=>BlocProvider.of(context);
final GetAreasUseCase _getAreasUseCase;
List<AreaEntity> areas=[];
  late AreaEntity selectedArea;

  loadAreas()async{
    if(areas.isEmpty){
      try {
        emit(AreasLoadingState());
        final data = await _getAreasUseCase.call(NoParameters());
        data.fold((l) {
          emit(AreasErrorState(error: l.message));
        }, (r) {
          r.isEmpty
              ? {
            emit(AreasEmptyState()),
          }
              : {
            areas = r,
            selectedArea = r.first,
            emit(AreasLoadedState(
                areas: areas, area: selectedArea)),
          };
        });
      } catch (e) {
        emit(AreasErrorState(error: e.toString()));
      }
    }else{


      emit(AreasLoadedState(
          areas: areas, area: selectedArea));
    }
  }

  selectArea(String name){
    final state= this.state;
    if(state is AreasLoadedState){
      selectedArea=areas.firstWhere((element) => element.name==name);
      emit(state.copyWith(area: selectedArea));
    }

  }
}

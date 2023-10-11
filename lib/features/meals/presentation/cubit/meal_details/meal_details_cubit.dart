import 'package:bloc/bloc.dart';
import 'package:cooking_recipes/shared/data/model/meal_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../shared/domain/entity/meal_entity.dart';
import '../../../domain/use_case/get_meal_by_id_use_case.dart';

part 'meal_details_state.dart';

class MealDetailsCubit extends Cubit<MealDetailsState> {
  MealDetailsCubit(this._getMeal) : super(MealDetailsInitial());
  GetMealByIDUseCase _getMeal;
  static MealDetailsCubit get(context) => BlocProvider.of(context);
  late MealEntity selectedMeal;
  MealEntity get meal => selectedMeal;
  loadMealById(String id) async {
    try {
      emit(MealDetailsLoading());
      final data = await _getMeal.call(id);
      data.fold((l) {
        emit(MealDetailsError(error: l.message));
      }, (r) {
        r.mealId == -1
            ? {
                emit(MealDetailsError(error: 'No Meal found')),
              }
            : {
                selectedMeal = r,
                emit(MealDetailsLoaded(meal: selectedMeal)),
              };
      });
    } catch (e) {
      emit(MealDetailsError(error: e.toString()));
    }
  }
 Future<MealEntity> getMealById(String id)async{
    try {

      final data = await _getMeal.call(id);
   return   data.fold((l) {
       return MealModel.emptyResponse();
      }, (r) {
     return r;
      });
    } catch (e){
      return MealModel.emptyResponse();
    }
  }
}

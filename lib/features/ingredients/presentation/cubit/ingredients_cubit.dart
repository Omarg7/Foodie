import 'package:bloc/bloc.dart';
import 'package:cooking_recipes/features/categories/domain/entity/category_entity.dart';
import 'package:cooking_recipes/features/categories/domain/use_case/get_categoires_use_case.dart';
import 'package:cooking_recipes/features/ingredients/domain/entity/ingredient_entity.dart';
import 'package:cooking_recipes/features/ingredients/domain/use_case/get_ingredients_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/use_case/base_use_case.dart';

part 'ingredients_state.dart';

class IngredientsCubit extends Cubit<IngredientsState> {
  IngredientsCubit(this._getIngredientsUseCase) : super(IngredientsInitialState());
 static IngredientsCubit get(context)=>BlocProvider.of(context);
GetIngredientsUseCase _getIngredientsUseCase;
  List<IngredientEntity> ingredients=[];
  late IngredientEntity selectedIngredient;

  loadIngredients()async{
    if(ingredients.isEmpty){
      try {
        emit(IngredientsLoadingState());
        final data = await _getIngredientsUseCase.call(NoParameters());
        data.fold((l) {
          emit(IngredientsErrorState(error: l.message));
        }, (r) {
          r.isEmpty
              ? {
            emit(IngredientsEmptyState()),
          }
              : {
            ingredients = r,
            selectedIngredient = r.first,
            emit(IngredientsLoadedState(
                ingredients: ingredients, selectedIngredient: selectedIngredient)),
          };
        });
      } catch (e) {
        emit(IngredientsErrorState(error: e.toString()));
      }
    }else{
      emit(IngredientsLoadedState(
          ingredients: ingredients, selectedIngredient: selectedIngredient));
    }
  }

  selectIngredient(int id){
    final state= this.state;
    if(state is IngredientsLoadedState){
      selectedIngredient=ingredients.firstWhere((element) => element.id==id);
      emit(state.copyWith(selectedIngredient: selectedIngredient));
    }

  }
}

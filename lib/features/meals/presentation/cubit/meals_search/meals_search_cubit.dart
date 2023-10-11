import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../shared/domain/entity/meal_entity.dart';
import '../../../domain/use_case/filter_meals_by_first_letter_use_case.dart';

part 'meals_search_state.dart';

class MealsSearchCubit extends Cubit<MealsSearchState> {
  MealsSearchCubit(this._searchMealsUseCase) : super(MealsSearchInitial(searchedText: ''));
  List<MealEntity> meals=[];
  final SearchMealsUseCase _searchMealsUseCase;
  static MealsSearchCubit get(context)=>BlocProvider.of(context);
  String name='';
  _searchForMeals(String searchedName)async{
    name=searchedName;
        if(meals.isEmpty && searchedName.length==1){

      emit(MealsSearchLoading(searchedText: name));
      final res= await _searchMealsUseCase.call(searchedName);

      res.fold((l) {
        emit(MealsSearchError(error: l.message,searchedText: name));
      }, (r){
        meals=r;
        emit(MealsSearchLoaded(meals: meals,searchedText: name));
      });
    }else{
       List<MealEntity>  matched=   meals.where((element) => element.name.toLowerCase().contains(searchedName.toLowerCase())).toList();
       emit(MealsSearchLoaded(meals: matched,searchedText: name));
    }
  }
  search(String searchedName){
    if(searchedName.isEmpty){
      clearSearched();
    }else{
      _searchForMeals(searchedName);
    }
  }
  clearSearched(){
    meals=[];
  emit(MealsSearchLoaded(meals: meals,searchedText: name));
  }
}

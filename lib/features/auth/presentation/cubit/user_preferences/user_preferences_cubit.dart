import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/prefrences/prefrences.dart';

part 'user_prefrences_state.dart';

class UserPreferencesCubit extends Cubit<UserPreferencesState> {
  UserPreferencesCubit() : super(UserPreferencesState(areas: Consts.availableCountries, selectedArea: Consts.availableCountries.keys.first, recommendations: Consts.availableFoodType, selectedRecommendation: Consts.availableFoodType.first ));
  static UserPreferencesCubit get(context)=>BlocProvider.of(context);


  Map<String,String> get areas=>Consts.availableCountries;
  String get area=>selectedArea;
  late String selectedRecommendation;
  late String selectedArea;
  late int selectedRecommendationIndex;
  late int selectedAreaIndex;
  List<String> get recommendations=>Consts.availableFoodType;
  String get recommendation=>selectedRecommendation;
initialize({
    String? country,
    String? foodType,
}){
  selectedArea=country??Consts.availableCountries.keys.first;
  selectedRecommendation=foodType??Consts.availableFoodType.first;

  emit(state.copyWith(selectedArea: selectedArea,selectedRecommendation:selectedRecommendation ));
}
  selectArea(String area){

    if(area!=selectedArea){
      selectedArea=area;
      emit(state.copyWith(selectedArea: selectedArea));
    }
  }

  searchArea(String name){
   if(name.isEmpty){
   emit(state.copyWith(areas: Consts.availableCountries));
   }else{

     Map<String,String> filtered={} ;
     Consts.availableCountries.forEach((key, value) {
       if(key.toLowerCase().contains(name.toLowerCase())){
         filtered[key]=value;
       }
     });
     emit(state.copyWith(areas: filtered));
   };

  }
  selectRecommendation(String recommended){

    if(recommended!=selectedRecommendation){
      selectedRecommendation=recommended;
      emit(state.copyWith(selectedRecommendation: selectedRecommendation));
    }
  }

  searchRecommendation(String name){
    if(name.isEmpty){
      emit(state.copyWith(recommendations: Consts.availableFoodType));
    }else{

      List<String> filtered=[] ;
      for (String value in Consts.availableFoodType) {
        if(value.toLowerCase().contains(name.toLowerCase())){
          filtered.add(value);
        }
      }
      emit(state.copyWith(recommendations: filtered));
    };

  }

}

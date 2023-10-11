import 'package:bloc/bloc.dart';
import 'package:cooking_recipes/core/use_case/base_use_case.dart';
import 'package:cooking_recipes/features/favourites/domain/use_case/add_favourite_meal_use_case.dart';
import 'package:cooking_recipes/features/favourites/domain/use_case/clear_all_favourites_use_case.dart';
import 'package:cooking_recipes/features/favourites/domain/use_case/get_favourites_meals_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';

import '../../../../shared/domain/entity/meal_entity.dart';
import '../../domain/use_case/remove_favourite_meal_use_case.dart';

part 'favourites_state.dart';
class FavouriteSuccess{
  String message;
  bool isSuccess;
  FavouriteSuccess({required this.message,required this.isSuccess});
}
class FavouritesCubit extends Cubit<FavouritesLoaded> {
  FavouritesCubit(this._clearFavouriteMealsUseCase,this._removeFavouriteMealUseCase,this._addFavouriteMealUseCase,this._getFavouriteMealsUseCase) : super(FavouritesLoaded(toastMessage: '',index: currentMealIndex,meals:favouriteMeals ));

GetFavouriteMealsUseCase _getFavouriteMealsUseCase;
AddFavouriteMealUseCase _addFavouriteMealUseCase;
RemoveFavouriteMealUseCase _removeFavouriteMealUseCase;
ClearFavouriteMealsUseCase _clearFavouriteMealsUseCase;
  static FavouritesCubit get(context)=>BlocProvider.of(context);
  static List<MealEntity> favouriteMeals=[];
List<MealEntity> get favourites=>favouriteMeals;

static int currentMealIndex=0;
changeIndex(int index){
  currentMealIndex=index;
  emit(FavouritesLoaded(toastMessage:'' ,index: currentMealIndex, meals: favouriteMeals));
}

loadFav(String uid)async{
  final res=await _getFavouriteMealsUseCase.call(uid);
  res.fold((l) {
    favouriteMeals=[];
    emit(FavouritesLoaded(toastMessage: '',index: currentMealIndex, meals: favouriteMeals));

  }, (r) {
    favouriteMeals=r;
    emit(FavouritesLoaded(toastMessage: '',index: currentMealIndex, meals: favouriteMeals));
  });
}

  Future<FavouriteSuccess> updateFav(MealEntity meal, bool isFav,String uid)async {
    FavouriteSuccess  res;
  if(meal.mealId!=-1){
      try {
        if (isFav) {
      bool  success=   await addToFav(meal,uid);
       res=FavouriteSuccess(message:success? 'Added Successfully':'Error Adding to favourites', isSuccess: success);

        } else {
          bool  success= await removeFromFav(meal,uid);
          res=FavouriteSuccess(message:success? 'Removed Successfully':'Error Removing from favourites', isSuccess: success);

        }
      } catch (e) {
        res=FavouriteSuccess(message:e.toString(), isSuccess: false);
      }
    }else{
    res=FavouriteSuccess(message:'Error!', isSuccess: false);

  }
  emit(FavouritesLoaded(toastMessage: '', meals: favouriteMeals, index: currentMealIndex));
  return res;
  }

  Future<bool>  addToFav(MealEntity meal,String uid) async {

   favouriteMeals=   List.of(favouriteMeals.toSet().toList())..add(meal);

    try {

        final res = await _addFavouriteMealUseCase.call(AddFavouriteItemParameter(meal: meal, username: uid));
     return   res.fold((l) {

          favouriteMeals.removeWhere((element) => element.mealId==meal.mealId);
        return false;
          }, (r) {
return true;
        });
      } catch (e) {


        favouriteMeals.removeWhere((element) => element.mealId==meal.mealId);
        return false;
    }

  }

  Future<bool>  removeFromFav(MealEntity meal, String uid) async {
    favouriteMeals=   List.of(favouriteMeals.toSet().toList())..removeWhere((element) => element.mealId==meal.mealId);





      try {
        final res = await _removeFavouriteMealUseCase.call(RemoveFavouriteMealParameter(mealId: meal.mealId, username: uid));
      return  res.fold((l) {

         favouriteMeals.add(meal);
         return false;
         }, (r) {
changeIndex(currentMealIndex-1,);
return true;
      });
      } catch (e) {
        favouriteMeals.add(meal);
        return false;
      }

  }

  clearFavourites(String uid) async{

    List<MealEntity> oldFav= [...favouriteMeals];
    favouriteMeals=[];
    try {
      final res=await _clearFavouriteMealsUseCase.call(uid);
      res.fold((l) {

        favouriteMeals=oldFav;
        emit(FavouritesLoaded(toastMessage: l.message,index: currentMealIndex, meals: favouriteMeals));

      }, (r)  {

changeIndex(0,);
      });
    } catch (e) {

      favouriteMeals=oldFav;
      emit(FavouritesLoaded(toastMessage: e.toString(),index: currentMealIndex, meals: favouriteMeals));

    }

  }
  bool checkIfFav(int mealId){
    final meal= favouriteMeals.firstWhere((element) => element.mealId==mealId,orElse: () => MealEntity(mealId: -1, name: '', category: '', area: '', instructions: [], thumbnail: '', tags: [], youtubeLink: '', ingredients: [], measures: [], recipeLink: ''));
    if(meal.mealId!=-1){
      return true;
    }else{
      return false;
    }
  }
}

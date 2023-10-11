part of 'meals_search_cubit.dart';

@immutable
abstract class MealsSearchState {
  final String searchedText;
  MealsSearchState({required this.searchedText});
}

class MealsSearchInitial extends MealsSearchState {
  MealsSearchInitial({required super.searchedText});
}
class MealsSearchLoading extends MealsSearchState {
  MealsSearchLoading({required super.searchedText});
}
class MealsSearchLoaded extends MealsSearchState {
 final List<MealEntity> meals;
 MealsSearchLoaded({required this.meals, required super.searchedText});

}
class MealsSearchError extends MealsSearchState {
  final String error;
  MealsSearchError({required this.error, required super.searchedText});
}
class MealsSearchEmpty extends MealsSearchState {
  MealsSearchEmpty({required super.searchedText});
}



part of 'favourites_cubit.dart';

@immutable
abstract class FavouritesState {}

class FavouritesInitial extends FavouritesState {}
class FavouritesLoading extends FavouritesState {}
class FavouritesLoaded extends FavouritesState {
  final List<MealEntity> meals;
  final int index;
  final String toastMessage;
  FavouritesLoaded({required this.toastMessage,required this.meals,required this.index});


}
class FavCurrentIndexChanged extends FavouritesState {
  final int index;
  FavCurrentIndexChanged({required this.index});


}
class FavouritesEmpty extends FavouritesState {}
class FavouritesError extends FavouritesState {
  final String error;
  FavouritesError({required this.error});
}
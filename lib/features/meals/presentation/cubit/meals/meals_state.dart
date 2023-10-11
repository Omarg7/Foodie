part of 'meals_cubit.dart';

@immutable
abstract class MealsState {}

class MealsInitial extends MealsState {}
class MealsLoading extends MealsState {}
class MealsLoaded extends MealsState {
  final List<MealEntity> meals;

  MealsLoaded({required this.meals,});
  MealsLoaded copyWith({List<MealEntity>? meals})=>MealsLoaded(meals: meals??this.meals,);
}
class MealsError extends MealsState {
  final String error;
  MealsError({required this.error});
}
class MealsEmpty extends MealsState {}


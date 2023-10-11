part of 'meal_details_cubit.dart';

@immutable
abstract class MealDetailsState {}

class MealDetailsInitial extends MealDetailsState {}
class MealDetailsLoading extends MealDetailsState {}
class MealDetailsLoaded extends MealDetailsState {
  MealDetailsLoaded({
    required this.meal,
});
final MealEntity meal;
}
class MealDetailsError extends MealDetailsState {
  MealDetailsError({
    required this.error,
  });
  final String error;
}


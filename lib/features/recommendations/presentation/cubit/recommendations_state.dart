part of 'recommendations_cubit.dart';

@immutable
abstract class RecommendationsState {
 const RecommendationsState();
}

class RecommendationsInitial extends RecommendationsState {}

class RecommendationsLoaded extends RecommendationsState {
 final List<MealEntity> recommendations;


const  RecommendationsLoaded({
    required this.recommendations,


});
  RecommendationsLoaded copyWith({List<MealEntity>? recommendations})=>RecommendationsLoaded(recommendations: recommendations??this.recommendations);
}
class RecommendationsError extends RecommendationsState {
 final String error;
 const RecommendationsError({required this.error});
}
class RecommendationsLoading extends RecommendationsState {}
class RecommendationsEmpty extends RecommendationsState {}

part of 'user_preferences_cubit.dart';


class UserPreferencesState {
  final Map<String,String> areas;
  final String selectedArea;
  final List<String> recommendations;
  final String selectedRecommendation;

  UserPreferencesState({required this.recommendations,required this.selectedRecommendation, required this.areas,required this.selectedArea});
  UserPreferencesState copyWith({Map<String,String>? areas,String? selectedArea,List<String>? recommendations,String? selectedRecommendation})=>UserPreferencesState(areas: areas??this.areas, selectedArea: selectedArea??this.selectedArea, recommendations:recommendations??this.recommendations, selectedRecommendation: selectedRecommendation??this.selectedRecommendation);
}

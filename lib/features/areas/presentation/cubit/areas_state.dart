part of 'areas_cubit.dart';

@immutable
abstract class AreasState {}

class AreasInitialState extends AreasState {}
class AreasLoadingState extends AreasState {}
class AreasLoadedState extends AreasState {
  final AreaEntity area;
  AreasLoadedState({required this.areas,required this.area});
  final List<AreaEntity> areas;
  AreasLoadedState copyWith({List<AreaEntity>? areas,AreaEntity? area})=>AreasLoadedState(areas: areas??this.areas, area: area??this.area);

}
class AreasEmptyState extends AreasState {}
class AreasErrorState extends AreasState {
  AreasErrorState({required this.error});
final String error;
}

part of 'categories_cubit.dart';

@immutable
abstract class CategoriesState {}

class CategoriesInitialState extends CategoriesState {}
class CategoriesLoadingState extends CategoriesState {}
class CategoriesLoadedState extends CategoriesState {

  CategoriesLoadedState({required this.categories,required this.category});
  final List<CategoryEntity> categories;
  final CategoryEntity category;
  CategoriesLoadedState copyWith({ List<CategoryEntity>? categories,CategoryEntity? category})=>CategoriesLoadedState(categories: categories??this.categories, category: category??this.category);
}
class CategoriesEmptyState extends CategoriesState {}
class CategoriesErrorState extends CategoriesState {
  CategoriesErrorState({required this.error});
final String error;
}

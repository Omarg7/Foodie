part of 'ingredients_cubit.dart';

@immutable
abstract class IngredientsState {}

class IngredientsInitialState extends IngredientsState {}
class IngredientsLoadingState extends IngredientsState {}
class IngredientsLoadedState extends IngredientsState {
 final IngredientEntity selectedIngredient;
  IngredientsLoadedState({required this.ingredients,required this.selectedIngredient});
  final List<IngredientEntity> ingredients;
 IngredientsLoadedState copyWith({List<IngredientEntity>? ingredients,IngredientEntity? selectedIngredient})=>IngredientsLoadedState(ingredients: ingredients??this.ingredients, selectedIngredient: selectedIngredient??this.selectedIngredient);
}
class IngredientsEmptyState extends IngredientsState {}
class IngredientsErrorState extends IngredientsState {
  IngredientsErrorState({required this.error});
final String error;
}

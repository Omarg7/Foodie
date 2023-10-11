import 'package:bloc/bloc.dart';
import 'package:cooking_recipes/core/use_case/base_use_case.dart';
import 'package:cooking_recipes/features/categories/domain/entity/category_entity.dart';
import 'package:cooking_recipes/features/categories/domain/use_case/get_categoires_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this._getCategoriesUseCase) : super(CategoriesInitialState());

GetCategoriesUseCase _getCategoriesUseCase;
static CategoriesCubit get(context)=>BlocProvider.of(context);
late CategoryEntity selectedCategory;
List<CategoryEntity> categories=[];
  loadCategories()async{
        if(categories.isEmpty){
      try {
        emit(CategoriesLoadingState());
        final data = await _getCategoriesUseCase.call(NoParameters());
        data.fold((l) {
          emit(CategoriesErrorState(error: l.message));
        }, (r) {
          r.isEmpty
              ? {
                  emit(CategoriesEmptyState()),
                }
              : {
                  categories = r,
                  selectedCategory = r.first,
                  emit(CategoriesLoadedState(
                      categories: categories, category: selectedCategory)),
                };
        });
      } catch (e) {
        emit(CategoriesErrorState(error: e.toString()));
      }
    }else{
          emit(CategoriesLoadedState(categories: categories, category: selectedCategory));
        }
  }

  selectCategory(String name){
    final state= this.state;
    if(state is CategoriesLoadedState){
      selectedCategory=categories.firstWhere((element) => element.name==name);
      emit(state.copyWith(category: selectedCategory));
    }

  }
}

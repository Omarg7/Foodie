import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'meals_filtering_state.dart';
enum FilterOption{
  categories,
  countries,
  ingredients,
}
class MealsFilteringCubit extends Cubit<MealsFilteringState> {
  MealsFilteringCubit() : super(MealsFilteringState(option:option ));
 static FilterOption option=FilterOption.categories;
  static MealsFilteringCubit get(context)=>BlocProvider.of(context);
  changeFilterOption(FilterOption? selectedOption){
    option=selectedOption??FilterOption.categories;
    emit(MealsFilteringState(option: option));
  }

}

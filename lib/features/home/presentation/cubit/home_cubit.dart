import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeScreenSelected> {
  HomeCubit() : super(const HomeScreenSelected(index: 0));
 int currentIndex=0;
  static HomeCubit get(context)=>BlocProvider.of(context);

  selectAndNav(int index){
    currentIndex=index;
    emit(HomeScreenSelected(index: currentIndex));
  }
}

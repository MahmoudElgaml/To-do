

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'select_category_state.dart';

class SelectCategoryCubit extends Cubit<SelectCategoryState> {
  SelectCategoryCubit() : super(SelectCategoryInitial());
  static SelectCategoryCubit get(context) => BlocProvider.of(context);
  int selectIndex=0;
  void changeCategory(int index){
    emit(SelectCategory());
    selectIndex=index;
    emit(SelectCategoryInitial());

  }
}

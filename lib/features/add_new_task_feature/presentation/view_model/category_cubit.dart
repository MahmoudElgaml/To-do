import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'category_state.dart';

class SelectCategoryCubit extends Cubit<SelectCategoryState> {
  SelectCategoryCubit() : super(SelectCategoryInitial());

  static SelectCategoryCubit get(context) => BlocProvider.of(context);
  int selectIndex = 0;

  void changeCategory(int index) {
    emit(SelectCategorySuccess());
    selectIndex = index;
    emit(SelectCategoryInitial());
  }
}

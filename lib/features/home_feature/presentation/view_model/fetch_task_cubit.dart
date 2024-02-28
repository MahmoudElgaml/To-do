import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:todolist_sqflite/features/home_feature/data/reop/home_repo.dart';

import '../../data/model/task_model.dart';

part 'fetch_task_state.dart';

class FetchTaskCubit extends Cubit<FetchTaskState> {
  FetchTaskCubit(this.homeRepo) : super(FetchTaskInitial());
  HomeRepo homeRepo;
  static FetchTaskCubit get(context) => BlocProvider.of(context);
  fetchTask() {
    homeRepo.fetchAllTask().fold(
          (fail) {
            emit(FetchTaskFail(fail.errorMessage));
          },
          (success) {
            emit(FetchTaskSuccess(success));
          },
        );
  }
}

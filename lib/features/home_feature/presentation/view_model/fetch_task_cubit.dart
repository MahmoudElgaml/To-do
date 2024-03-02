import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:todolist_sqflite/core/error/failure.dart';
import 'package:todolist_sqflite/core/utils/helpers.dart';
import 'package:todolist_sqflite/features/home_feature/data/reop/home_repo.dart';

import '../../data/model/task_model.dart';

part 'fetch_task_state.dart';

class FetchTaskCubit extends Cubit<FetchTaskState> {
  FetchTaskCubit(this.homeRepo) : super(FetchTaskInitial());
  HomeRepo homeRepo;
  List<TaskModel> completedTask = [];
  List<TaskModel> unCompletedTask = [];

  String selectedDate=Helper.dateToString(DateTime.now());

  static FetchTaskCubit get(context) => BlocProvider.of(context);

  fetchCompletedTask(String date) {
    homeRepo.fetchCompletedTask(date).fold(
      (fail) {
        emit(FetchTaskFail(fail.errorMessage));
      },
      (success) {
        completedTask = success;
        emit(FetchTaskSuccess());
      },
    );
  }

  fetchUnCompletedTask(String date) {
    homeRepo.fetchUnCompletedTask(date).fold(
      (fail) {
        emit(FetchTaskFail(fail.errorMessage));
      },
      (success) {
        unCompletedTask = success;
        emit(FetchTaskSuccess());
      },
    );
  }

  updateTask(bool value, TaskModel task) async {
    var result = await homeRepo.updateTask(value, task);
    result.fold((error) => emit(FetchTaskFail(error.errorMessage)),
        (r) => emit(UpdateTaskState()));
  }

  deleteTask(TaskModel task) async {
    var result = await homeRepo.deleteTask(task);
    result.fold(
      (error) => emit(FetchTaskFail(error.errorMessage)),
      (r) => emit(DeleteTaskState()),
    );
  }

  onChangeDate(DateTime selectDate) {
    selectedDate=Helper.dateToString(selectDate);
    fetchCompletedTask(Helper.dateToString(selectDate));
    fetchUnCompletedTask(Helper.dateToString(selectDate));
  }
}

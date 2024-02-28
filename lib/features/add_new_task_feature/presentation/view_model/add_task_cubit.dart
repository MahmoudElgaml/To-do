import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:todolist_sqflite/core/error/failure.dart';
import 'package:todolist_sqflite/features/add_new_task_feature/data/add_task_repo.dart';
import 'package:todolist_sqflite/features/home_feature/data/model/task_model.dart';

part 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskRepo addTaskRepo;

  AddTaskCubit(this.addTaskRepo) : super(AddTaskInitial());

  static AddTaskCubit get(context) => BlocProvider.of(context);

  addTask(TaskModel task) async {
    emit(AddTaskLoading());

    if (task.title == null) {
      emit(AddTaskFailure("title is null"));
    } else {
      var result = await addTaskRepo.addTask(task);

      result.fold(
        (fail) => emit(
          AddTaskFailure(fail.toString()),
        ),
        (success) => emit(AddTaskSuccess()),
      );
    }
  }
}

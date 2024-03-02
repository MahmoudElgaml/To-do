import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:todolist_sqflite/core/error/failure.dart';
import 'package:todolist_sqflite/core/utils/constants.dart';
import 'package:todolist_sqflite/features/add_new_task_feature/data/add_task_repo.dart';
import 'package:todolist_sqflite/features/home_feature/data/model/task_model.dart';

class AddTaskRepoimpl implements AddTaskRepo {
  @override
  Future<Either<Failure, int>> addTask(TaskModel task) async {
    try {
      var myBox = Hive.box<TaskModel>(taskBox);
      await myBox.add(task);

      return right(0);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}

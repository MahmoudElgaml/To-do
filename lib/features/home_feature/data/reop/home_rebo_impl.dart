import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:todolist_sqflite/core/error/failure.dart';
import 'package:todolist_sqflite/core/utils/constants.dart';
import 'package:todolist_sqflite/features/home_feature/data/model/task_model.dart';
import 'package:todolist_sqflite/features/home_feature/data/reop/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  var myBox = Hive.box<TaskModel>(taskBox);

  @override
  Either<Failure, List<TaskModel>> fetchCompletedTask(String date) {
    try {
      List<TaskModel> completedTask =
          myBox.values.where((element) => element.isCompleted&&date==element.date).toList();
      return right(completedTask);
    } catch (e) {
      return left(CacheFail(e.toString()));
    }
  }

  @override
  Either<Failure, List<TaskModel>> fetchUnCompletedTask(String date) {
    try {
      List<TaskModel> completedTask =
          myBox.values.where((element) => !element.isCompleted&&date==element.date).toList();
      return right(completedTask);
    } catch (e) {
      return left(CacheFail(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateTask(bool value, TaskModel task) async {
    try {
      task.isCompleted = value;
      await task.save();
      return right(null);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteTask(TaskModel task) async {
    try {
      await task.delete();
      return right(null);
    } catch (e) {
      return left(CacheFail(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteAllTask(List<TaskModel> tasks) async{
    try{
      for(var i in tasks){
       await i.delete();
      }
      return right(null);
    }
    catch(e){
      return left(CacheFail(e.toString()));

    }

  }
}

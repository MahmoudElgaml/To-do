import 'package:dartz/dartz.dart';
import 'package:todolist_sqflite/core/error/failure.dart';
import 'package:todolist_sqflite/features/home_feature/data/model/task_model.dart';

abstract class HomeRepo {
  Either<Failure,List<TaskModel>> fetchUnCompletedTask(String date);
  Either<Failure,List<TaskModel>> fetchCompletedTask(String date);
   Future< Either<Failure,void>> updateTask(bool value,TaskModel task);
   Future< Either<Failure,void>> deleteTask(TaskModel task);
   Future< Either<Failure,void>> deleteAllTask(List<TaskModel> tasks);
}

import 'package:dartz/dartz.dart';
import 'package:todolist_sqflite/core/error/failure.dart';
import 'package:todolist_sqflite/features/home_feature/data/model/task_model.dart';

abstract class HomeRepo {
  Either<Failure,List<TaskModel>> fetchUnCompletedTask();
  Either<Failure,List<TaskModel>> fetchCompletedTask();
}

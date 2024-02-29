import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:todolist_sqflite/core/error/failure.dart';
import 'package:todolist_sqflite/core/utils/constants.dart';
import 'package:todolist_sqflite/features/home_feature/data/model/task_model.dart';
import 'package:todolist_sqflite/features/home_feature/data/reop/home_repo.dart';

class HomeRepoImpl implements HomeRepo{
 var myBox =Hive.box<TaskModel>(taskBox);
 @override
  Either<Failure, List<TaskModel>> fetchCompletedTask() {
     try{
       List<TaskModel> completedTask =myBox.values.where((element) => element.isCompleted).toList();
      return right(completedTask);
     }
     catch(e){
      return left(CacheFail(e.toString()));
     }
  }

  @override
  Either<Failure, List<TaskModel>> fetchUnCompletedTask() {
    try{
      List<TaskModel> completedTask =myBox.values.where((element) => !element.isCompleted).toList();
      return right(completedTask);
    }
    catch(e){
      return left(CacheFail(e.toString()));
    }
  }




}
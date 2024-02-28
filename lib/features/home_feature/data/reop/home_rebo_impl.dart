import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:todolist_sqflite/core/error/failure.dart';
import 'package:todolist_sqflite/core/utils/constants.dart';
import 'package:todolist_sqflite/features/home_feature/data/model/task_model.dart';
import 'package:todolist_sqflite/features/home_feature/data/reop/home_repo.dart';

class HomeRepoImpl implements HomeRepo{
  @override
  Either<Failure, List<TaskModel>> fetchAllTask() {
    try{
      var myBox= Hive.box<TaskModel>(taskBox);
     var result= myBox.values.toList();
     return right(result);
    }
        catch(e){
      return left(CacheFail(e.toString()));

        }
  }


}
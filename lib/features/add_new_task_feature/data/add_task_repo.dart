import 'package:todolist_sqflite/features/home_feature/data/model/task_model.dart';

abstract class AddTaskRepo {
  void addTask(TaskModel task);
}

import 'package:hive/hive.dart';

import '../../../../core/utils/task_category.dart';
part'task_model.g.dart';
@HiveType(typeId: 1)
class TaskModel extends HiveObject{
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String note;
  @HiveField(3)
  final String date;
  @HiveField(4)
  final String time;
  @HiveField(5)
  final bool isCompleted;
  @HiveField(6)
  final TaskCategory taskCategory;

  TaskModel({
    this.id,
    required this.title,
    required this.note,
    required this.date,
    required this.time,
    required this.taskCategory,
    required this.isCompleted,
  });
}

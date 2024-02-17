import '../../../../core/utils/task_category.dart';

class TaskModel {
  final int? id;
  final String title;
  final String note;
  final String date;
  final String time;
  final bool isCompleted;
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

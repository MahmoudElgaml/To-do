import 'package:flutter/material.dart';
import 'package:todolist_sqflite/features/home_feature/data/model/task_model.dart';

class CostumeCategory extends StatelessWidget {
  TaskModel task;

  CostumeCategory(this.task, {super.key});

  @override
  Widget build(BuildContext context) {
    final double iconOpacity = task.isCompleted ? 0.3 : 0.5;
    final double backgroundOpacity = task.isCompleted ? 0.1 : 0.3;
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: task.taskCategory.color.withOpacity(backgroundOpacity),
        border: Border.all(
          width: 2,
          color: task.taskCategory.color,
        ),
      ),
      child: Center(
        child: Icon(
          task.taskCategory.icon,
          size: 35,
          color: task.taskCategory.color.withOpacity(iconOpacity),
        ),
      ),
    );
  }
}

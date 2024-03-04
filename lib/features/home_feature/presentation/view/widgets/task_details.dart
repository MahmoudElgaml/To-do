import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todolist_sqflite/core/utils/constants.dart';
import 'package:todolist_sqflite/core/utils/extentions.dart';
import 'package:todolist_sqflite/core/utils/widgets/costume_category.dart';
import 'package:todolist_sqflite/features/home_feature/data/model/task_model.dart';

class TaskDetail extends StatelessWidget {
  TaskModel task;

  TaskDetail(this.task, {super.key});

  @override
  Widget build(BuildContext context) {
    final textDecoration =
        task.isCompleted ? TextDecoration.lineThrough : TextDecoration.none;
    final fontWeight = task.isCompleted ? FontWeight.normal : FontWeight.bold;
    return Column(
      children: [
        CostumeCategory(task: task.taskCategoryId!),
        const Gap(15),
        Text(
          task.title ?? "",
          style: context.textTheme.titleLarge!.copyWith(
            fontWeight: fontWeight,
          ),
        ),
        const Gap(7),
        Text(
          task.time,
          style: context.textTheme.titleLarge,
        ),
        const Gap(15),
        Text(
          "Task To be completed on ${task.date}",
          style: context.textTheme.titleLarge!
              .copyWith(decoration: textDecoration),
        ),
        const Gap(15),
        Divider(
          thickness: 1.5,
          color: categories[task.taskCategoryId!].color,
          indent: 4,
          endIndent: 4,
        ),
        const Gap(10),
        Text(
          task.note ?? "",
          style: context.textTheme.titleMedium,
        ),
      ],
    );
  }
}

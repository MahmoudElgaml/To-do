import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todolist_sqflite/core/utils/extentions.dart';
import 'package:todolist_sqflite/core/utils/widgets/costume_category.dart';
import 'package:todolist_sqflite/features/home_feature/data/model/task_model.dart';
import 'package:todolist_sqflite/features/home_feature/presentation/view/widgets/task_details.dart';

class TaskTile extends StatelessWidget {
  TaskTile(this.task, {super.key});

  TaskModel task;

  @override
  Widget build(BuildContext context) {
    final textDecoration =
        task.isCompleted ? TextDecoration.lineThrough : TextDecoration.none;
    final fontWeight = task.isCompleted ? FontWeight.normal : FontWeight.bold;
    final double iconOpacity = task.isCompleted ? 0.3 : 0.5;
    final double backgroundOpacity = task.isCompleted ? 0.1 : 0.3;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: InkWell(
        onLongPress: () {
          // delete task
        },
        onTap: () async {
          // show detail
          await buildShowModalBottomSheet(context);
        },
        child: Row(
          children: [
            CostumeCategory(
                task: task.taskCategoryId!,
                backgroundOpacity: iconOpacity,
                iconOpacity: backgroundOpacity),
            const Gap(15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.title??"",
                  style: context.textTheme.titleLarge!.copyWith(
                    fontWeight: fontWeight,
                    decoration: textDecoration,
                  ),
                ),
                Text(task.time, style: context.textTheme.titleMedium),
              ],
            ),
            const Spacer(),
            Checkbox(
              value: task.isCompleted,
              onChanged: (value) {
                value = true;
              },
            )
          ],
        ),
      ),
    );
  }

  Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: TaskDetail(task),
          ),
        );
      },
    );
  }
}

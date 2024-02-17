import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todolist_sqflite/core/utils/extentions.dart';
import 'package:todolist_sqflite/core/utils/widgets/costume_container.dart';
import 'package:todolist_sqflite/features/home_feature/data/model/task_model.dart';
import 'package:todolist_sqflite/features/home_feature/presentation/view/widgets/task_tile.dart';

class ListTask extends StatelessWidget {
  ListTask({this.isCompleted = false, required this.tasks, super.key});

  List<TaskModel> tasks;
  bool isCompleted;

  @override
  Widget build(BuildContext context) {
    final emptyMessage =
        isCompleted ? "Not Complete Message! " : " There is no task";
    final double height = isCompleted
        ? context.deviceSize.height * 0.25
        : context.deviceSize.height * 0.3;
    return CostumeContainer(
      height: height,
      child: tasks.isEmpty
          ? Center(
              child: Text(
                emptyMessage,
                style: context.textTheme.headlineSmall,
              ),
            )
          : ListView.separated(
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (context, index) => const Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return TaskTile(tasks[index]);
              },
              itemCount: tasks.length,
            ),
    );
  }
}

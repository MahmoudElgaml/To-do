import 'package:flutter/material.dart';
import 'package:todolist_sqflite/core/utils/extentions.dart';
import 'package:todolist_sqflite/core/utils/widgets/costume_container.dart';
import 'package:todolist_sqflite/features/home_feature/data/model/task_model.dart';

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
      child: tasks.isEmpty?  Center(
        child: Text(
          emptyMessage,
          style: context.textTheme.headlineSmall,
        ),
      ):ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return  Row(
            children: [
              const CircleAvatar(
                child: Icon(Icons.health_and_safety_outlined),
              ),
              Column(
                children: [
                  const Text(),
                  const Text("11.50 Am"),
                  const Spacer(),
                  Checkbox(value: true, onChanged: (value) {},)
                ],
              )
            ],
          );
        },
        itemCount: 8,
      ),
    );
  }
}

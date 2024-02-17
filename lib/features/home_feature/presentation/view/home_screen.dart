import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:todolist_sqflite/config/routes/routes.dart';
import 'package:todolist_sqflite/core/utils/extentions.dart';
import 'package:todolist_sqflite/core/utils/task_category.dart';
import 'package:todolist_sqflite/core/utils/widgets/costume_container.dart';
import 'package:todolist_sqflite/core/utils/widgets/display_white_string.dart';
import 'package:todolist_sqflite/features/home_feature/presentation/view/widgets/list_build_task.dart';
import 'package:todolist_sqflite/features/home_feature/data/model/task_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    return Scaffold(
        body: Stack(
      children: [
        Column(
          children: [
            Container(
              width: double.infinity,
              height: context.deviceSize.height * 0.3,
              color: colors.primary,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DisplayWhiteString(
                    text: "Aug6,2023",
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                  ),
                  DisplayWhiteString(text: "My ToDo List", fontSize: 40),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: context.deviceSize.height * 0.22,
          right: 0,
          left: 0,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ListTask(
                  tasks: [
                    TaskModel(
                        title: "Be Active On YouTube",
                        note: "notesd",
                        date: "11/3",
                        time: "11,3 AM",
                        taskCategory: TaskCategory.education,
                        isCompleted: false),
                    TaskModel(
                        title: "Title",
                        note: "notesd",
                        date: "11/3",
                        time: "11,3 AM",
                        taskCategory: TaskCategory.personal,
                        isCompleted: false),
                  ],
                ),
                const Gap(10),
                Text(
                  "completed",
                  style: context.textTheme.headlineMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Gap(10),
                ListTask(
                  tasks: [
                    TaskModel(
                      title: "Title",
                      note: "notesd",
                      date: "11/3",
                      time: "11,3 AM",
                      taskCategory: TaskCategory.education,
                      isCompleted: true,
                    ),
                    TaskModel(
                      title: "Title",
                      note: "notesd",
                      date: "11/3",
                      time: "11,3 AM",
                      taskCategory: TaskCategory.health,
                      isCompleted: true,
                    ),
                  ],
                  isCompleted: true,
                ),
                const Gap(10),
                ElevatedButton(
                    onPressed: () {
                      context.push(AppRouter.addNewTaskScreen);
                    },
                    child: DisplayWhiteString(
                      text: "Add New Task",
                      fontSize: 20,
                    ))
              ],
            ),
          ),
        ),
        const Text("completed")
      ],
    ));
  }
}

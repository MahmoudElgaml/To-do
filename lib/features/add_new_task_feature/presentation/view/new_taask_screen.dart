import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todolist_sqflite/core/utils/extentions.dart';
import 'package:todolist_sqflite/core/utils/widgets/display_white_string.dart';
import 'package:todolist_sqflite/features/add_new_task_feature/presentation/view/widgets/costume_text_field.dart';
import 'package:todolist_sqflite/features/home_feature/presentation/view/widgets/task_tile.dart';

class NewTaskScreen extends StatefulWidget {
  NewTaskScreen({Key? key}) : super(key: key);

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  TimeOfDay? selectTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: DisplayWhiteString(
          text: 'Add New Task',
          fontSize: 25,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const CostumeTextFiled(
              titleText: "TaskTitle",
              hintText: "Task Title",
            ),
            const Gap(20),
            Row(
              children: [
                Expanded(
                  child: CostumeTextFiled(
                    titleText: "Date",
                    hintText: "Aug6,2023",
                    iconButton: IconButton(
                      onPressed: () async {
                        await showDate(context);
                      },
                      icon: const Icon(Icons.date_range),
                    ),
                  ),
                ),
                const Gap(10),
                Expanded(
                  child: CostumeTextFiled(
                    titleText: "Time",
                    hintText: "$selectTime" ?? "${TimeOfDay.now()}",
                    iconButton: IconButton(
                      onPressed: () async {
                        await showTime(context);
                        setState(() {});
                      },
                      icon: const Icon(Icons.access_time_outlined),
                    ),
                  ),
                ),
              ],
            ),
            const Gap(20),
            const CostumeTextFiled(
              titleText: "Notes",
              hintText: "Notes",
              maxLines: 6,
            ),
            Gap(15),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                "Save",
                style: context.textTheme.titleMedium!
                    .copyWith(color: Colors.white, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> showDate(BuildContext context) async {
    await showDatePicker(
        context: context, firstDate: DateTime.now(), lastDate: DateTime(2090));
  }

  Future<void> showTime(BuildContext context) async {
    selectTime =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:todolist_sqflite/core/utils/extentions.dart';
import 'package:todolist_sqflite/core/utils/widgets/display_white_string.dart';
import 'package:todolist_sqflite/features/add_new_task_feature/presentation/view/widgets/costume_text_field.dart';
import 'package:todolist_sqflite/features/add_new_task_feature/presentation/view_model/chang_date_time_cubit.dart';
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
    return BlocProvider(
      create: (context) => ChangDateTimeCubit(),
      child: Scaffold(
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
              BlocBuilder<ChangDateTimeCubit, ChangDateTimeState>(
                builder: (context, state) {
                  return Row(
                    children: [
                      Expanded(
                        child: CostumeTextFiled(
                          titleText: "Date",
                          hintText: ChangDateTimeCubit.get(context).date.toString().substring(0,10),
                          iconButton: IconButton(
                            onPressed: () async {
                             ChangDateTimeCubit.get(context).showDate(context);
                            },
                            icon: const Icon(Icons.date_range),
                          ),
                        ),
                      ),
                      const Gap(10),
                      Expanded(
                        child: CostumeTextFiled(
                          titleText: "Time",
                          hintText: "${ChangDateTimeCubit
                              .get(context)
                              .time}",
                          iconButton: IconButton(
                            onPressed: () {
                              ChangDateTimeCubit.get(context).showTime(context);
                            },
                            icon: const Icon(Icons.access_time_outlined),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              const Gap(20),
              const CostumeTextFiled(
                titleText: "Notes",
                hintText: "Notes",
                maxLines: 6,
              ),
              const Gap(15),
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
      ),
    );
  }




}

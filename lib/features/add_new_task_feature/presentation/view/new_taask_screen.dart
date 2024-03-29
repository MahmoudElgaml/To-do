import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import 'package:todolist_sqflite/config/routes/routes.dart';

import 'package:todolist_sqflite/core/utils/extentions.dart';
import 'package:todolist_sqflite/core/utils/helpers.dart';

import 'package:todolist_sqflite/core/utils/widgets/display_white_string.dart';
import 'package:todolist_sqflite/features/add_new_task_feature/data/add_task_repo_impll.dart';
import 'package:todolist_sqflite/features/add_new_task_feature/presentation/view/widgets/costume_text_field.dart';
import 'package:todolist_sqflite/features/add_new_task_feature/presentation/view/widgets/select_category.dart';

import 'package:todolist_sqflite/features/add_new_task_feature/presentation/view/widgets/select_date_time.dart';
import 'package:todolist_sqflite/features/add_new_task_feature/presentation/view_model/add_task_cubit.dart';
import 'package:todolist_sqflite/features/add_new_task_feature/presentation/view_model/chang_date_time_cubit.dart';

import 'package:todolist_sqflite/features/home_feature/data/model/task_model.dart';

import 'package:todolist_sqflite/features/home_feature/presentation/view_model/fetch_task_cubit.dart';

import '../view_model/category_cubit.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({Key? key}) : super(key: key);

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  late String title;
  String? note;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ChangDateTimeCubit(),
        ),
        BlocProvider(
          create: (context) => AddTaskCubit(AddTaskRepoimpl()),
        ),
        BlocProvider(
          create: (context) => SelectCategoryCubit(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const DisplayWhiteString(
            text: 'Add New Task',
            fontSize: 25,
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: SingleChildScrollView(
            child: BlocConsumer<AddTaskCubit, AddTaskState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is AddTaskLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is AddTaskFailure) {
                  return Text(state.errorMessage);
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CostumeTextFiled(
                      titleText: "TaskTitle",
                      hintText: "Task Title",
                      formKey: _formKey,
                      onChanged: (value) {
                        title = value;
                      },
                    ),
                    const Gap(15),
                    const SelectCategory(),
                    const Gap(20),
                    const SelectDateTime(),
                    const Gap(20),
                    CostumeTextFiled(
                      titleText: "Notes",
                      hintText: "Notes",
                      maxLines: 6,
                      onChanged: (value) {
                        note = value;
                      },
                    ),
                    const Gap(15),
                    BlocBuilder<FetchTaskCubit, FetchTaskState>(
                      builder: (context, state) {
                        return ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              var task = TaskModel(
                                title: title,
                                note: note,
                                date: Helper.dateToString(
                                    ChangDateTimeCubit.get(context).date!),
                                time: Helper.timeToString(
                                    ChangDateTimeCubit.get(context).time),
                                taskCategoryId: SelectCategoryCubit.get(context)
                                    .selectIndex,
                                isCompleted: false,
                              );
                              AddTaskCubit.get(context).addTask(task);
                              FetchTaskCubit.get(context)
                                  .fetchUnCompletedTask();
                              FetchTaskCubit.get(context).fetchCompletedTask();
                              context.go(AppRouter.homeScreen);
                            }
                          },
                          child: Text(
                            "Save",
                            style: context.textTheme.titleMedium!
                                .copyWith(color: Colors.white, fontSize: 20),
                          ),
                        );
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

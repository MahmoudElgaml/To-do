import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:todolist_sqflite/core/utils/extentions.dart';
import 'package:todolist_sqflite/core/utils/widgets/costume_container.dart';
import 'package:todolist_sqflite/features/home_feature/data/model/task_model.dart';
import 'package:todolist_sqflite/features/home_feature/presentation/view/widgets/task_tile.dart';
import 'package:todolist_sqflite/features/home_feature/presentation/view_model/fetch_task_cubit.dart';

class ListTask extends StatefulWidget {
  ListTask({this.isCompleted = false, required this.tasks, super.key});

  List<TaskModel> tasks;
  bool isCompleted;

  @override
  State<ListTask> createState() => _ListTaskState();
}

class _ListTaskState extends State<ListTask> {
  @override
  void initState()  {
    FetchTaskCubit.get(context).fetchTask();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final emptyMessage =
        widget.isCompleted ? "Not Complete Message! " : " There is no task";
    final double height = widget.isCompleted
        ? context.deviceSize.height * 0.25
        : context.deviceSize.height * 0.3;
    return BlocBuilder<FetchTaskCubit, FetchTaskState>(
      builder: (context, state) {
        if (state is FetchTaskFail) {
          return Center(child: Text(state.errorMessage));
        } else if (state is FetchTaskSuccess) {
          return CostumeContainer(
            height: height,
            child: state.task.isEmpty
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
                      return TaskTile(state.task[index]);
                    },
                    itemCount: state.task.length,
                  ),
          );
        } else {
          return const Text(" aha");
        }
      },
    );
  }
}

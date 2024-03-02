import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist_sqflite/core/utils/extentions.dart';
import 'package:todolist_sqflite/core/utils/widgets/costume_container.dart';
import 'package:todolist_sqflite/features/home_feature/presentation/view/widgets/task_tile.dart';
import 'package:todolist_sqflite/features/home_feature/presentation/view_model/fetch_task_cubit.dart';

class ListTask extends StatefulWidget {
  ListTask({this.isCompleted = false, super.key});

  bool isCompleted;

  @override
  State<ListTask> createState() => _ListTaskState();
}

class _ListTaskState extends State<ListTask> {
  @override
  void initState() {
    widget.isCompleted
        ? FetchTaskCubit.get(context).fetchCompletedTask()
        : FetchTaskCubit.get(context).fetchUnCompletedTask();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final emptyMessage =
        widget.isCompleted ? "Not Complete Message!" : " There is no task";
    final double height = widget.isCompleted
        ? context.deviceSize.height * 0.25
        : context.deviceSize.height * 0.3;
    return BlocConsumer<FetchTaskCubit, FetchTaskState>(
        listener: (context, state) {
      if (state is UpdateTaskState) {
        widget.isCompleted
            ? FetchTaskCubit.get(context).fetchCompletedTask()
            : FetchTaskCubit.get(context).fetchUnCompletedTask();
      }
      if (state is DeleteTaskState) {
        widget.isCompleted
            ? FetchTaskCubit.get(context).fetchCompletedTask()
            : FetchTaskCubit.get(context).fetchUnCompletedTask();
      }
    }, builder: (context, state) {
      if (state is FetchTaskFail) {
        return Center(child: Text(state.errorMessage));
      } else {
        return CostumeContainer(
          height: height,
          child: (widget.isCompleted
                  ? FetchTaskCubit.get(context).completedTask.isEmpty
                  : FetchTaskCubit.get(context).unCompletedTask.isEmpty)
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
                    return TaskTile(widget.isCompleted
                        ? FetchTaskCubit.get(context).completedTask[index]
                        : FetchTaskCubit.get(context).unCompletedTask[index]);
                  },
                  itemCount: widget.isCompleted
                      ? FetchTaskCubit.get(context).completedTask.length
                      : FetchTaskCubit.get(context).unCompletedTask.length,
                ),
        );
      }
    });
  }
}

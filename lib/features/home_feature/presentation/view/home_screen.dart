import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:todolist_sqflite/config/routes/routes.dart';
import 'package:todolist_sqflite/core/utils/extentions.dart';
import 'package:todolist_sqflite/core/utils/task_category.dart';
import 'package:todolist_sqflite/core/utils/widgets/costume_container.dart';
import 'package:todolist_sqflite/core/utils/widgets/display_white_string.dart';
import 'package:todolist_sqflite/features/home_feature/data/reop/home_rebo_impl.dart';
import 'package:todolist_sqflite/features/home_feature/presentation/view/widgets/list_build_task.dart';
import 'package:todolist_sqflite/features/home_feature/data/model/task_model.dart';
import 'package:todolist_sqflite/features/home_feature/presentation/view_model/fetch_task_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                height: context.deviceSize.height * 0.3,
                color: colors.primary,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Gap(20),
                    BlocBuilder<FetchTaskCubit, FetchTaskState>(
                      builder: (context, state) {
                        return EasyDateTimeLine(
                          dayProps: const EasyDayProps(width: 80),
                          initialDate: DateTime.now(),
                          onDateChange: (selectedDate) {
                            FetchTaskCubit.get(context)
                                .onChangeDate(selectedDate);
                          },
                        );
                      },
                    ),
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
                  ListTask(),
                  const Gap(10),
                  Text(
                    "completed",
                    style: context.textTheme.headlineMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Gap(10),
                  ListTask(
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
        ],
      )),
    );
  }
}

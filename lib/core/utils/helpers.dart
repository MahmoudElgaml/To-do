import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:todolist_sqflite/core/utils/constants.dart';

import '../../features/home_feature/data/model/task_model.dart';

abstract class Helper {
  static String timeToString(TimeOfDay time) {
    try {
      final DateTime now = DateTime.now();
      final date = DateTime(
        now.year,
        now.month,
        now.day,
        time.hour,
        time.minute,
      );
      final formatType = DateFormat.jm();
      return formatType.format(date);
    } catch (e) {
      return '12:00';
    }
  }

  static List<TaskModel> getCompletedTask() {
    List<TaskModel> completedTask = [];
    for (var task in Hive.box<TaskModel>(taskBox).values.toList()) {
      if (task.isCompleted) {
        completedTask.add(task);
      }
    }
    return completedTask;
  }
}

import 'package:flutter/material.dart';
import 'package:todolist_sqflite/core/utils/constants.dart';
import 'package:todolist_sqflite/core/utils/extentions.dart';
import 'package:todolist_sqflite/core/utils/task_category.dart';
import 'package:todolist_sqflite/features/home_feature/data/model/task_model.dart';

class CostumeCategory extends StatelessWidget {
  int task;
  double backgroundOpacity;
  double iconOpacity;
  bool isSelected;

  CostumeCategory(
      {required this.task,
      this.iconOpacity = 0.5,
      this.backgroundOpacity = 0.3,
        this.isSelected=false,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color:isSelected?context.colorScheme.primary: categories[task].color.withOpacity(backgroundOpacity),
        border: Border.all(
          width: 2,
          color: categories[task].color,
        ),
      ),
      child: Center(
        child: Icon(
         categories[task].icon,
          size: 35,
          color: categories[task].color.withOpacity(iconOpacity),
        ),
      ),
    );
  }
}

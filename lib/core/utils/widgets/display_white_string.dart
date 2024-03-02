import 'package:flutter/material.dart';
import 'package:todolist_sqflite/core/utils/extentions.dart';

class DisplayWhiteString extends StatelessWidget {
 final String text;
 final double fontSize;
 final FontWeight? fontWeight;

  const DisplayWhiteString(
      {required this.text, required this.fontSize, this.fontWeight, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.textTheme.headlineSmall!.copyWith(
          color: context.colorScheme.surface,
          fontSize: fontSize,
          fontWeight: fontWeight ?? FontWeight.bold),
    );
  }
}

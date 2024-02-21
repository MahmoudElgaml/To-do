import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todolist_sqflite/core/utils/extentions.dart';

class CostumeTextFiled extends StatelessWidget {

  final String hintText;
  final String titleText;

  final int maxLines;
 final IconButton? iconButton;

   const CostumeTextFiled({ required this.hintText, super.key,  this.maxLines=1, required this.titleText,this.iconButton});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:   CrossAxisAlignment.start,
      children: [
        Text(titleText,style: context.textTheme.titleMedium,),
        const Gap(10),
        TextField(
          maxLines: maxLines,
        decoration: InputDecoration(
          hintText: hintText,
           suffixIcon: iconButton

        ),
        ),
      ],
    );
  }
}
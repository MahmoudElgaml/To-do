import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todolist_sqflite/core/utils/extentions.dart';

class CostumeTextFiled extends StatelessWidget {
  final String hintText;
  final String titleText;
  void Function(String)? onChanged;
  final int maxLines;
  final IconButton? iconButton;
  final GlobalKey<FormState>?  formKey;
  CostumeTextFiled(
      {required this.hintText,
      super.key,
      this.maxLines = 1,
      required this.titleText,
      this.iconButton,
        this.onChanged,
        this.formKey
   });

  @override

  Widget build(BuildContext context) {
    return Form(
      key:formKey ,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titleText,
            style: context.textTheme.titleMedium,
          ),
          const Gap(10),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            onChanged:onChanged ,
            maxLines: maxLines,
            decoration:
                InputDecoration(hintText: hintText, suffixIcon: iconButton),
          ),
        ],
      ),
    );
  }
}

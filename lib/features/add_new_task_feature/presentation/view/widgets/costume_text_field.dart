import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todolist_sqflite/core/utils/extentions.dart';

class CostumeTextFiled extends StatelessWidget {
  final String hintText;
  final String titleText;
 final void Function(String)? onChanged;
  final int maxLines;
  final IconButton? iconButton;
final  void Function()? onTap;
  final bool isRead;
  final GlobalKey<FormState>? formKey;

  const CostumeTextFiled(
      {required this.hintText,
      super.key,
      this.maxLines = 1,
      required this.titleText,
        this.isRead=false,
        this.onTap,
      this.iconButton,
      this.onChanged,
      this.formKey});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titleText,
            style: context.textTheme.headlineMedium,
          ),
          const Gap(10),
          TextFormField(
            readOnly: isRead ,
            onTap: isRead?onTap:null,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            onChanged: onChanged,
            maxLines: maxLines,
            decoration:
                InputDecoration(hintText: hintText, suffixIcon: iconButton),
          ),
        ],
      ),
    );
  }
}

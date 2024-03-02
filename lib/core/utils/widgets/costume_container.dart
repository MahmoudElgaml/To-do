import 'package:flutter/material.dart';
import 'package:todolist_sqflite/core/utils/extentions.dart';

class CostumeContainer extends StatelessWidget {
 final Widget child;
 final double height;
  const CostumeContainer({ required this.child, super.key,required this.height});


  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: colors.primaryContainer,
      ),
      width: context.deviceSize.width,
      child: child,
    );
  }
}

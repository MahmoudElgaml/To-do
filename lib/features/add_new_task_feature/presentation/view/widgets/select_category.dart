import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:todolist_sqflite/core/utils/extentions.dart';
import 'package:todolist_sqflite/features/add_new_task_feature/presentation/view_model/select_category_cubit.dart';

import '../../../../../core/utils/app_string.dart';
import '../../../../../core/utils/task_category.dart';
import '../../../../../core/utils/widgets/costume_category.dart';

class SelectCategory extends StatefulWidget {
  SelectCategory({Key? key}) : super(key: key);

  @override
  State<SelectCategory> createState() => _SelectCategoryState();
}

class _SelectCategoryState extends State<SelectCategory> {


  @override
  Widget build(BuildContext context) {
    final categories = TaskCategory.values.toList();
    return BlocProvider(
      create: (context) => SelectCategoryCubit(),
      child: SizedBox(
        height: 60,
        child: Row(
          children: [
            Text(
              AppString.category,
              style: context.textTheme.headlineMedium,
            ),
            const Gap(15),
            BlocBuilder<SelectCategoryCubit, SelectCategoryState>(
              builder: (context, state) {
                return Expanded(
                  child: ListView.separated(
                    physics: const AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          SelectCategoryCubit.get(context).changeCategory(index);

                        },
                        child: CostumeCategory(
                          task: categories[index],
                          isSelected: SelectCategoryCubit.get(context).selectIndex == index,
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const Gap(10),
                    itemCount: categories.length,
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
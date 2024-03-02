
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:todolist_sqflite/core/utils/constants.dart';
import 'package:todolist_sqflite/core/utils/extentions.dart';
import 'package:todolist_sqflite/features/add_new_task_feature/presentation/view_model/category_cubit.dart';

import '../../../../../core/utils/app_string.dart';

import '../../../../../core/utils/widgets/costume_category.dart';

class SelectCategory extends StatelessWidget {
  const SelectCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                        SelectCategoryCubit.get(context).changeCategory(
                            index);
                      },
                      child: CostumeCategory(
                        task: index,
                        isSelected: SelectCategoryCubit
                            .get(context)
                            .selectIndex == index,
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
    );
  }
}

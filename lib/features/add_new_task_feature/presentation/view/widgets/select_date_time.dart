import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utils/helpers.dart';
import '../../view_model/chang_date_time_cubit.dart';
import 'costume_text_field.dart';

class SelectDateTime extends StatelessWidget {
  const SelectDateTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangDateTimeCubit, ChangDateTimeState>(
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              child: CostumeTextFiled(
                onTap:() => ChangDateTimeCubit.get(context).showDate(context) ,
                isRead: true,
                titleText: "Date",
                hintText: Helper.dateToString(
                    ChangDateTimeCubit.get(context).date ?? DateTime.now()),
                iconButton: IconButton(
                  onPressed: () async {

                  },
                  icon: const Icon(Icons.date_range),
                ),
              ),
            ),
            const Gap(10),
            Expanded(
              child: CostumeTextFiled(
                onTap: () =>  ChangDateTimeCubit.get(context).showTime(context),
                isRead: true,
                titleText: "Time",
                hintText:
                    Helper.timeToString(ChangDateTimeCubit.get(context).time),
                iconButton: IconButton(
                  onPressed: () {
                  },
                  icon: const Icon(Icons.access_time_outlined),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

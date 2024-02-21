import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'chang_date_time_state.dart';

class ChangDateTimeCubit extends Cubit<ChangDateTimeState> {
  static ChangDateTimeCubit get(context) => BlocProvider.of(context);
  ChangDateTimeCubit() : super(ChangDateTimeInitial());
  TimeOfDay time = TimeOfDay.now();
  DateTime? date=DateTime.now();

  Future<void> showTime(BuildContext context) async {
    emit(ChangeTime());
    time = await showTimePicker(context: context, initialTime: time)??TimeOfDay.now();
    emit(ChangDateTimeInitial());
  }
  Future<void> showDate(BuildContext context) async {
    emit(ChangeDate());
    date= await showDatePicker(
        context: context, firstDate: DateTime.now(), lastDate: DateTime(2090),initialDate:date );
    emit(ChangDateTimeInitial());
  }
}

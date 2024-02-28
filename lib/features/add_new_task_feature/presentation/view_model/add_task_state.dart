part of 'add_task_cubit.dart';

@immutable
abstract class AddTaskState {}

class AddTaskInitial extends AddTaskState {}

class AddTaskLoading extends AddTaskState {}

class AddTaskSuccess extends AddTaskState {}

class AddTaskFailure extends AddTaskState {
  String errorMessage;

  AddTaskFailure(this.errorMessage);
}

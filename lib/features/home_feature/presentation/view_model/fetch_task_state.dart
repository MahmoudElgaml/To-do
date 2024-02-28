part of 'fetch_task_cubit.dart';

@immutable
abstract class FetchTaskState {}

class FetchTaskInitial extends FetchTaskState {}
class FetchTaskSuccess extends FetchTaskState {
  List<TaskModel> task;

  FetchTaskSuccess(this.task);
}
class FetchTaskFail extends FetchTaskState {
  final String errorMessage;

  FetchTaskFail(this.errorMessage);
}


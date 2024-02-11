class TaskModel {
  final int? id;
  final String title;
  final String note;
  final String date;
  final String time;

  TaskModel(
      {this.id,
      required this.title,
      required this.note,
      required this.date,
      required this.time});
}

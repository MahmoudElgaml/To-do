import 'package:go_router/go_router.dart';
import 'package:todolist_sqflite/features/add_new_task_feature/presentation/view/new_taask_screen.dart';
import 'package:todolist_sqflite/features/home_feature/presentation/view/home_screen.dart';

class AppRouter{
  static const String homeScreen="/";
  static const String addNewTaskScreen="/newTask";

  static final router=GoRouter(
      routes: [
        GoRoute(path: homeScreen, builder: (context, state) => const HomeScreen(),),
        GoRoute(path: addNewTaskScreen, builder: (context, state) =>  const NewTaskScreen(),),
      ]

  );

}
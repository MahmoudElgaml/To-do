import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todolist_sqflite/config/routes/routes.dart';
import 'package:todolist_sqflite/config/themeing/app_themeing.dart';
import 'package:todolist_sqflite/core/utils/constants.dart';
import 'package:todolist_sqflite/features/home_feature/data/model/task_model.dart';
import 'package:todolist_sqflite/features/home_feature/data/reop/home_rebo_impl.dart';
import 'package:todolist_sqflite/features/home_feature/presentation/view/home_screen.dart';
import 'package:todolist_sqflite/features/home_feature/presentation/view_model/fetch_task_cubit.dart';

import 'core/utils/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox<TaskModel>(taskBox);


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FetchTaskCubit(HomeRepoImpl()),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppTheming.light,
        title: 'Flutter Demo',
        routerConfig: AppRouter.router,
      ),
    );
  }
}

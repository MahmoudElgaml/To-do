import 'package:flutter/material.dart';
import 'package:todolist_sqflite/config/routes/routes.dart';
import 'package:todolist_sqflite/config/themeing/app_themeing.dart';
import 'package:todolist_sqflite/features/home_feature/presentation/view/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheming.light,
      title: 'Flutter Demo',
      routerConfig: AppRouter.router,
    );
  }
}

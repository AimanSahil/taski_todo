import 'package:flutter/material.dart';
import 'screens/todo_screen.dart';
import 'screens/create_task_screen.dart';
import 'screens/completed_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Taski Todo",
      initialRoute: '/',
      routes: {
        '/': (context) => const TodoScreen(),
        '/create': (context) => const CreateTaskScreen(),
        '/completed': (context) => const CompletedScreen(),
      },
    );
  }
}
import 'package:flutter/material.dart';
import '../data/task_data.dart';

class CompletedScreen extends StatefulWidget {
  const CompletedScreen({super.key});

  @override
  State<CompletedScreen> createState() =>
      _CompletedScreenState();
}

class _CompletedScreenState extends State<CompletedScreen> {

  int currentIndex = 2;

  void navigate(int index) {

    if (index == 0) {
      Navigator.pushNamed(context, '/');
    }

    if (index == 1) {
      Navigator.pushNamed(context, '/create');
    }
  }

  @override
  Widget build(BuildContext context) {

    final completedTasks =
        tasks.where((task) => task.isCompleted).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Completed Tasks"),
      ),

      body: ListView.builder(
        itemCount: completedTasks.length,
        itemBuilder: (context, index) {

          return ListTile(
            leading: const Icon(
              Icons.check_circle,
              color: Colors.green,
            ),
            title: Text(
              completedTasks[index].title,
            ),
          );
        },
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: navigate,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "Tasks",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: "Create",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle),
            label: "Completed",
          ),
        ],
      ),
    );
  }
}
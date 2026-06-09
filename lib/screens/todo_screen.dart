import 'package:flutter/material.dart';
import '../data/task_data.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {

  int currentIndex = 0;

  void navigate(int index) {
    setState(() {
      currentIndex = index;
    });

    if (index == 1) {
      Navigator.pushNamed(context, '/create');
    }

    if (index == 2) {
      Navigator.pushNamed(context, '/completed');
    }
  }

  @override
  Widget build(BuildContext context) {
    final pendingTasks =
        tasks.where((task) => !task.isCompleted).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo Tasks"),
      ),

      body: ListView.builder(
        itemCount: pendingTasks.length,
        itemBuilder: (context, index) {

          return ListTile(
            title: Text(pendingTasks[index].title),

            trailing: Checkbox(
              value: pendingTasks[index].isCompleted,
              onChanged: (value) {
                setState(() {
                  pendingTasks[index].isCompleted = value!;
                });
              },
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
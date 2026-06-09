import 'package:flutter/material.dart';
import '../data/task_data.dart';
import '../models/task_model.dart';

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({super.key});

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  final TextEditingController controller = TextEditingController();

  int currentIndex = 1;

  void navigate(int index) {
    if (index == 0) {
      Navigator.pushNamed(context, '/');
    }

    if (index == 2) {
      Navigator.pushNamed(context, '/completed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Task"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: "Enter task",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                if (controller.text.isNotEmpty) {
                  tasks.add(
                    Task(
                      title: controller.text,
                    ),
                  );

                  controller.clear();

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Task Added"),
                    ),
                  );

                  // Go back to Todo screen
                  Navigator.pushNamed(context, '/');
                }
              },
              child: const Text("Add Task"),
            ),
          ],
        ),
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
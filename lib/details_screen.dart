import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final int value;

  const DetailsScreen({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Details")),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Received Counter Value",
              style: TextStyle(fontSize: 20),
            ),

            const SizedBox(height: 10),

            Text(
              "$value",
              style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Back"),
            ),
          ],
        ),
      ),
    );
  }
}

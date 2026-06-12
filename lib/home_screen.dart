import 'package:flutter/material.dart';
import 'details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {

  int counter = 0;
  late TabController tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(
      length: 2,
      vsync: this,
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        bottom: TabBar(
          controller: tabController,
          tabs: const [
            Tab(text: "Counter"),
            Tab(text: "Welcome"),
          ],
        ),
      ),

      body: TabBarView(
        controller: tabController,
        children: [

          // Counter Tab
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                const Text(
                  "Counter Value",
                  style: TextStyle(fontSize: 20),
                ),

                const SizedBox(height: 10),

                Text(
                  "$counter",
                  style: const TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                ElevatedButton(
                  onPressed: incrementCounter,
                  child: const Text("Increment"),
                ),

                const SizedBox(height: 10),

                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailsScreen(
                          value: counter,
                        ),
                      ),
                    );
                  },
                  child: const Text("Open Details"),
                ),
              ],
            ),
          ),

          // Welcome Tab
          const Center(
            child: Text(
              "Welcome",
              style: TextStyle(fontSize: 24),
            ),
          ),
        ],
      ),
    );
  }
}
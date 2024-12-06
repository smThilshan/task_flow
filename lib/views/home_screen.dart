import 'package:flutter/material.dart';
import 'package:task_flow/widgets/overview_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Flow'),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              // Navigate to profile or settings screen
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Task Overview
            const Text(
              'Overview',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OverviewCard(title: 'Total Tasks', count: 10),
                  SizedBox(width: 10),
                  OverviewCard(title: 'Pending Tasks', count: 5),
                  SizedBox(width: 10),
                  OverviewCard(title: 'Completed Tasks', count: 5),
                  SizedBox(width: 10),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Add Task Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/add-task');
                },
                child: const Text('Add Task'),
              ),
            ),
            const SizedBox(height: 32),

            // Task List
            const Text(
              'Your Tasks',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      leading: const Icon(Icons.task),
                      title: const Text('Task Title'),
                      subtitle: const Text('Due Date: 2024-12-07'),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          // Implement task deletion
                        },
                      ),
                      onTap: () {
                        // Navigate to Task Details Screen
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

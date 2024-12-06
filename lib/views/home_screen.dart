import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_flow/models/task_model.dart';
import 'package:task_flow/views_model/task_view_model.dart';
import 'package:task_flow/widgets/overview_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final taskViewModel = context.watch<TaskViewModel>();
    final tasks = taskViewModel.tasks;

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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OverviewCard(
                    title: 'Total Tasks',
                    count: tasks.length,
                  ),
                  const SizedBox(width: 10),
                  OverviewCard(
                    title: 'Pending Tasks',
                    count: 10,
                  ),
                  const SizedBox(width: 10),
                  OverviewCard(
                    title: 'Completed Tasks',
                    count: 5,
                  ),
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
              child: tasks.isEmpty
                  ? const Center(child: Text('No tasks available.'))
                  : ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        final task = tasks[index];
                        return Card(
                          margin: const EdgeInsets.only(bottom: 12),
                          child: ListTile(
                            leading: const Icon(Icons.task),
                            title: Text(task.title),
                            subtitle: Text(
                              'Due Date: ${task.dueDate.toString().split(' ')[0]}',
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                taskViewModel.deleteTask(task.id!);
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

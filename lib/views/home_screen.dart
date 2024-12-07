import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_flow/views_model/task_view_model.dart';
import 'package:task_flow/widgets/overview_widget.dart';
import 'package:task_flow/utils/constants.dart';
import 'package:task_flow/widgets/task_card_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final taskViewModel = context.watch<TaskViewModel>();
    final tasks = taskViewModel.tasks;

    final screenWidth = AppConstants.getScreenWidth(context);
    // final screenHeight = AppConstants.getScreenHeight(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
        padding: EdgeInsets.all(screenWidth * 0.03),
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
                  const OverviewCard(
                    title: 'Pending Tasks',
                    count: 10,
                  ),
                  const SizedBox(width: 10),
                  const OverviewCard(
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
                        return TaskCardWidget(
                          task: task,
                          taskViewModel: taskViewModel,
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

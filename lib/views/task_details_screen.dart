import 'package:flutter/material.dart';
import 'package:task_flow/models/task_model.dart';
import 'package:task_flow/views/edit_task_screen.dart';

class TaskDetailsScreen extends StatelessWidget {
  final TaskModel task;

  const TaskDetailsScreen({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              task.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              task.description,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            Text(
              'Due Date: ${task.dueDate.toLocal().toString().split(' ')[0]}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditTaskScreen(task: task),
                      ),
                    );
                  },
                  icon: const Icon(Icons.edit),
                  label: const Text('Edit Task'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

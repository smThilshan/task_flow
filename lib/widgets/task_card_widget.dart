import 'package:flutter/material.dart';
import 'package:task_flow/views/task_details_screen.dart';
import 'package:task_flow/views_model/task_view_model.dart';
import 'package:task_flow/models/task_model.dart';

class TaskCardWidget extends StatelessWidget {
  final TaskModel task;
  final TaskViewModel taskViewModel;

  const TaskCardWidget(
      {super.key, required this.task, required this.taskViewModel});

  @override
  Widget build(BuildContext context) {
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
            // Show a SnackBar indicating the task was deleted successfully
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Task deleted successfully!')),
            );
          },
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TaskDetailsScreen(task: task),
            ),
          );
        },
      ),
    );
  }
}

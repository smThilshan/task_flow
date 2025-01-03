import 'package:flutter/material.dart';
import '../models/task_model.dart';
import '../services/database_service.dart';

class TaskViewModel extends ChangeNotifier {
  final DatabaseService _databaseService = DatabaseService();
  List<TaskModel> _tasks = [];

  List<TaskModel> get tasks => _tasks;

  // Load tasks from the database
  Future<void> loadTasks() async {
    _tasks = await _databaseService.getTasks();
    notifyListeners();
  }

  // Add a task
  Future<void> addTask(
      String title, String description, DateTime dueDate) async {
    final task =
        TaskModel(title: title, description: description, dueDate: dueDate);
    // Debug print
    // print('Saving Task: ${task.toMap()}');
    await _databaseService.insertTask(task);
    await loadTasks();
  }

  // Update a task
  void updateTask(int id, String title, String description, DateTime dueDate) {
    final taskIndex = _tasks.indexWhere((task) => task.id == id);
    if (taskIndex != -1) {
      _tasks[taskIndex] = TaskModel(
        id: id,
        title: title,
        description: description,
        dueDate: dueDate,
      );
      notifyListeners();
    }
  }

  // Delete a task
  Future<void> deleteTask(int id) async {
    await _databaseService.deleteTask(id);
    await loadTasks();
  }
}

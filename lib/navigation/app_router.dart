import 'package:flutter/material.dart';
import 'package:task_flow/models/task_model.dart';
import 'package:task_flow/views/add_task_screen.dart';
import 'package:task_flow/views/edit_task_screen.dart';
import 'package:task_flow/views/home_screen.dart';
import 'package:task_flow/views/splash_screen.dart';
import 'package:task_flow/views/task_details_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/splash':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/task-details':
        final task = settings.arguments as TaskModel;
        return MaterialPageRoute(
            builder: (_) => TaskDetailsScreen(
                  task: task,
                ));
      case '/add-task':
        return MaterialPageRoute(builder: (_) => const AddTaskScreen());
      case '/edit-task':
        final task = settings.arguments as TaskModel;
        return MaterialPageRoute(
            builder: (_) => EditTaskScreen(
                  task: task,
                ));
      default:
        return MaterialPageRoute(
            builder: (_) => const HomeScreen()); // Default route
    }
  }
}

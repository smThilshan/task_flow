// file: lib/navigation/app_router.dart

import 'package:flutter/material.dart';
import 'package:task_flow/views/add_task_screen.dart';
import 'package:task_flow/views/home_screen.dart';
import 'package:task_flow/views/splash_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case '/splash':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case '/task-details':
      // final taskId = settings.arguments as int; // Pass arguments if needed
      // return MaterialPageRoute(builder: (_) => TaskDetailsScreen());
      case '/add-task':
        return MaterialPageRoute(builder: (_) => AddTaskScreen());
      default:
        return MaterialPageRoute(builder: (_) => HomeScreen()); // Default route
    }
  }
}


// Navigator.push(
//   context,
//   MaterialPageRoute(builder: (context) => NextScreen()),
// );
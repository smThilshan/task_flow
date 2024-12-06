// main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_flow/navigation/app_router.dart';
import 'package:task_flow/services/database_service.dart';
import 'package:task_flow/views/splash_screen.dart';
import 'package:task_flow/views_model/task_view_model.dart';
import 'views/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseService().init(); // Initialize SQLite database
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TaskViewModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Task Flow',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: '/splash',
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}

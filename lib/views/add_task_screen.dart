import 'package:flutter/material.dart';
import 'package:task_flow/views_model/task_view_model.dart';
import 'package:task_flow/widgets/title_widget.dart';
import 'package:provider/provider.dart';
import 'package:task_flow/utils/constants.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  DateTime? _selectedDate;

  // Function to show the Date Picker
  Future<void> _pickDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  // Save the task and send it to the TaskViewModel
  void _saveTask() {
    final title = _titleController.text.trim();
    final description = _descriptionController.text.trim();

    if (title.isEmpty || description.isEmpty || _selectedDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('All fields are required!')),
      );
      return;
    }

    Provider.of<TaskViewModel>(context, listen: false).addTask(
      title,
      description,
      _selectedDate!,
    );
    // Show a SnackBar indicating the task was added successfully
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Task added successfully!')),
    );

    Navigator.pop(context); // Go back to the previous screen
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = AppConstants.getScreenWidth(context);
    // ignore: unused_local_variable
    final screenHeight = AppConstants.getScreenHeight(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Task'),
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TitleTextFieldWidget(
              controller: _titleController,
              labelText: "Task Title",
            ),
            const SizedBox(height: 16),
            TitleTextFieldWidget(
              controller: _descriptionController,
              labelText: "Task Description",
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () => _pickDate(context),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  _selectedDate == null
                      ? "Select Date"
                      : "Due Date: ${_selectedDate!.toLocal().toString().split(' ')[0]}",
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _saveTask,
              child: const Text('Save Task'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_flow/models/task_model.dart';
import 'package:task_flow/views_model/task_view_model.dart';

class EditTaskScreen extends StatefulWidget {
  final TaskModel task;

  const EditTaskScreen({Key? key, required this.task}) : super(key: key);

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.task.title);
    _descriptionController =
        TextEditingController(text: widget.task.description);
    _selectedDate = widget.task.dueDate;
  }

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

  void _updateTask() {
    final title = _titleController.text.trim();
    final description = _descriptionController.text.trim();

    if (title.isEmpty || description.isEmpty || _selectedDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('All fields are required!')),
      );
      return;
    }

    Provider.of<TaskViewModel>(context, listen: false).updateTask(
      widget.task.id!,
      title,
      description,
      _selectedDate!,
    );

    Navigator.pop(context); // Go back to the previous screen
    Navigator.pop(context); // Close Task Details Screen and refresh
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: "Task Title"),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: "Task Description"),
              maxLines: 3,
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
              onPressed: _updateTask,
              child: const Text('Update Task'),
            ),
          ],
        ),
      ),
    );
  }
}

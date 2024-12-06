import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerWidget extends StatelessWidget {
  final DateTime? selectedDate;
  final void Function(DateTime) onDateSelected;
  final String labelText;

  const DatePickerWidget({
    Key? key,
    required this.selectedDate,
    required this.onDateSelected,
    this.labelText = 'Select Date',
  }) : super(key: key);

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      onDateSelected(pickedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _pickDate(context),
      child: AbsorbPointer(
        child: TextField(
          decoration: InputDecoration(
            labelText: selectedDate == null
                ? labelText
                : DateFormat.yMMMd().format(selectedDate!),
            border: const OutlineInputBorder(),
            suffixIcon: const Icon(Icons.calendar_today),
          ),
        ),
      ),
    );
  }
}

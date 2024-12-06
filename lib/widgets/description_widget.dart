import 'package:flutter/material.dart';

class DescriptionTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final int maxLines;

  const DescriptionTextFieldWidget({
    Key? key,
    required this.controller,
    required this.labelText,
    this.maxLines = 1, // Default to single-line input
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
      ),
    );
  }
}

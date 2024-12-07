import 'package:flutter/material.dart';

class TitleTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final int maxLines;

  const TitleTextFieldWidget({
    super.key,
    required this.controller,
    required this.labelText,
    this.maxLines = 3,
  });

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

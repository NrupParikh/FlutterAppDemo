import 'package:flutter/material.dart';

class MyCheckBox extends StatefulWidget {
  final String label;

  const MyCheckBox({super.key, required this.label});

  @override
  State<MyCheckBox> createState() => _MyCheckBoxState();
}

class _MyCheckBoxState extends State<MyCheckBox> {
  bool? _value = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            value: _value,
            onChanged: (newValue) => setState(() => _value = newValue)),
        Text(
          widget.label,
          style: const TextStyle(color: Color((0xE6969696))),
        ),
      ],
    );
  }
}

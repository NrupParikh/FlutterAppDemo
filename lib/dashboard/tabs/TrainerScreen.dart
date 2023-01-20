import 'package:flutter/material.dart';

class TrainerScreen extends StatefulWidget {
  final TextStyle optionStyle;

  const TrainerScreen({
    super.key,
    required this.optionStyle,
  });

  @override
  State<TrainerScreen> createState() => _TrainerScreenState();
}

class _TrainerScreenState extends State<TrainerScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Trainer",
          style: widget.optionStyle,
        ),
        
      ],
    );
  }
}

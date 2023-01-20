import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  final TextStyle optionStyle;

  const MenuScreen({
    super.key,
    required this.optionStyle,
  });

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Menu",
          style: widget.optionStyle,
        ),
        
      ],
    );
  }
}

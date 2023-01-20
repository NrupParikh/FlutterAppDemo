import 'package:flutter/material.dart';

class MyPassword extends StatefulWidget {

  final bool isLoading;
  const MyPassword({super.key,required this.isLoading });

  @override
  State<MyPassword> createState() => _MyPasswordState();
}

class _MyPasswordState extends State<MyPassword> {
  bool _obscureText = false;

  void _togglePasswordStatus() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        RegExp regex = RegExp(
            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

        if (value == null || value.isEmpty) {
          return "Please enter password";
        } else if (!regex.hasMatch(value)) {
          return "Password should contain at least one upper case, lower case, digit, special character and have at least 8 character in length.";
        }
        return null;
      },
      enabled: widget.isLoading ? false : true,
      obscureText: _obscureText,
      keyboardType: TextInputType.text,
      style: const TextStyle(color: Color((0xE6969696))),
      decoration: InputDecoration(
        errorMaxLines: 2,
        errorStyle: const TextStyle(color: Colors.yellow),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 3, color: Color(0x1AFFFFFF))),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 3, color: Color(0x1AFFFFFF))),
        labelText: "Password",
        hintText: "Enter Password",
        hintStyle: const TextStyle(color: Color((0xE6969696))),
        labelStyle: const TextStyle(color: Color((0xE6969696))),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: _togglePasswordStatus,
          color: const Color((0x66666666)),
        ),
      ),
    );
  }
}

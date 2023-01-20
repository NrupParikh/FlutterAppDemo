import 'package:first_flutter_app/common/UserPreferences.dart';
import 'package:flutter/material.dart';

import '../../common/MyImagePicker.dart';

class HomeScreen extends StatefulWidget {
  final TextStyle optionStyle;

  const HomeScreen({
    super.key,
    required this.optionStyle,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _userLogin = false;
  String _emailId = "";

  @override
  void initState() {
    super.initState();
    _userLogin = UserPreferences.getIsUserLoggedIn() ?? false;
    _emailId = UserPreferences.getEmailId() ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Home " '$_userLogin',
          style: widget.optionStyle,
        ),
        Text(
          "Email " '$_emailId',
          style: widget.optionStyle,
        ),
        const MyImagePicker()
      ],
    );
  }
}

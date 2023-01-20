
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


// ============ RESET PASSWORD BOTTOM SHEET DIALOG
void displayToast(String message,ToastGravity gravity) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: gravity,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0
  );
}

import 'package:first_flutter_app/auth/ForgotPasswordResetLinkBSD.dart';
import 'package:flutter/material.dart';

import '../common/MyPassword.dart';

// ============ RESET PASSWORD BOTTOM SHEET DIALOG
void displayResetPassword(BuildContext context) {
  showModalBottomSheet<dynamic>(
    // context and builder are
    // required properties in this widget
    context: context,
    isScrollControlled: true,
    // color is applied to main screen when modal bottom screen is displayed
    barrierColor: Colors.black45,
    //background color for modal bottom screen
    backgroundColor: Colors.grey,
    //elevates modal bottom screen
    elevation: 10,
    // gives rounded corner to modal bottom screen
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    builder: (BuildContext context) {
      // we set up a container inside which
      // we create center column and display text

      // Returning SizedBox instead of a Container
      return Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SizedBox(
          height: 400,
          child: Container(
            color: Colors.black87,
            child: Padding(
              padding:
              const EdgeInsets.all(8.0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 12),
                  const Text('Reset Password',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Colors.white,
                      )),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                        'Set the new password for your account so you can login and access all the features.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Color((0x48FFFFFF)),
                        )),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: MyPassword(isLoading: false),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: MyPassword(isLoading: false),
                  ),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          minimumSize: const Size.fromHeight(48)),
                      onPressed: () {
                        displayForgotPasswordResetLink(context);
                      },
                      child: const Text(
                        "Continue",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

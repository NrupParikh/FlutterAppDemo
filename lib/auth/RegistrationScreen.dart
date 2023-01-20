import 'package:first_flutter_app/auth/LoginScreen.dart';
import 'package:flutter/material.dart';

import '../common/MyPassword.dart';
import '../common/MySpannableCheckBox.dart';
import '../common/screenanimation/EnterExitRoute.dart';

class RegistrationScreen extends StatefulWidget {
  final bool isBackArrowVisible;
  final bool isTitleVisible;
  final bool isProfileVisible;

  const RegistrationScreen(
      {super.key,
      required this.isBackArrowVisible,
      required this.isTitleVisible,
      required this.isProfileVisible});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: Visibility(
          visible: widget.isBackArrowVisible,
          child: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),

        //title: const Text("Login Screen"), centerTitle: true,
        title: Visibility(
          visible: widget.isTitleVisible,
          replacement: Center(
              child: Image.asset("assets/images/header_logo_in_shape.png")),
          child: const Center(child: Text("Login Screen")),
        ),
        actions: widget.isProfileVisible
            ? [
                IconButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Profile Clicked"),
                    ));
                  },
                  icon: const Icon(Icons.person_rounded),
                ),
              ]
            : [],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ============ SIGN IN
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(24.0),
              child: const Text(
                "Sign Up",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                    color: Colors.white),
              ),
            ),

            // ============ EMAIL
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(24.0),
              child: TextFormField(
                obscureText: false,
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(color: Color((0xE6969696))),
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 3, color: Color(0x1AFFFFFF))),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 3, color: Color(0x1AFFFFFF))),
                  labelText: 'Email',
                  hintText: 'Enter Email',
                  hintStyle: TextStyle(color: Color((0xE6969696))),
                  labelStyle: TextStyle(color: Color((0xE6969696))),
                ),
              ),
            ),

            // ============ PASSWORD
            Container(
                alignment: Alignment.topLeft,
                padding:
                    const EdgeInsets.only(left: 24.0, right: 24.0, top: 2.0),
                child:  const MyPassword(isLoading: false)),

            Container(
                alignment: Alignment.topLeft,
                padding:
                    const EdgeInsets.only(left: 24.0, right: 24.0, top: 26.0),
                child: const MyPassword(isLoading: false)),

            // ============ CHECKBOX REMEMBER ME AND FORGOT PASSWORD TEXT

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  padding:
                      const EdgeInsets.only(left: 14.0, right: 24.0, top: 2.0),
                  child: Wrap(
                    direction: Axis.horizontal,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: const [MySpannableCheckBox()],
                  ),
                )
              ],
            ),
            // ==== BUTTON
            Container(
              alignment: Alignment.center,
              padding:
                  const EdgeInsets.only(left: 24.0, right: 24.0, top: 24.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    minimumSize: const Size.fromHeight(48)),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Button Clicked"),
                  ));
                },
                child: const Text(
                  "Sign Up",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.white),
                ),
              ),
            ),

            // ===== DIVIDER

            Container(
                alignment: Alignment.center,
                padding:
                    const EdgeInsets.only(left: 24.0, right: 24.0, top: 24.0),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    const Divider(
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 60.0,
                      height: 40.0,
                      child: Card(
                          color: Colors.black,
                          child: Container(
                            alignment: Alignment.center,
                            child: const Text(
                              "or",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                  color: Colors.white),
                            ),
                          )),
                    )
                  ],
                )),

            // ========= GOOGLE AND APPLE LOGIN BUTTON
            Container(
              alignment: Alignment.center,
              padding:
                  const EdgeInsets.only(left: 24.0, right: 24.0, top: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("Google Button Clicked"),
                        ));
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                            width: 2.0, color: Color(0x1AFFFFFF)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        //apply padding to some sides only
                        child: Image.asset(
                          "assets/images/ic_google_logo_48.png",
                          width: 24,
                          height: 24,
                        ),
                      )),
                  OutlinedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("Apple Button Clicked"),
                        ));
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                            width: 2.0, color: Color(0x1AFFFFFF)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        //apply padding to some sides only
                        child: Image.asset(
                          "assets/images/ic_apple_logo_48.png",
                          width: 24,
                          height: 24,
                        ),
                      )),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text(
                  "Already have an account? ",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.white),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      EnterExitRoute(
                          exitPage: widget,
                          enterPage : const LoginScreen(
                              isBackArrowVisible: false,
                              isTitleVisible: false,
                              isProfileVisible: false)),
                    );
                  },
                  child: const Text(
                    "Sign In",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.green),
                  ),
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}

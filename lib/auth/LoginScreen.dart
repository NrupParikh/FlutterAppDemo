import 'package:first_flutter_app/auth/ResetPasswordBSD.dart';
import 'package:first_flutter_app/common/UserPreferences.dart';
import 'package:first_flutter_app/common/screenanimation/EnterExitRoute.dart';
import 'package:first_flutter_app/dashboard/Dashboard.dart';
import 'package:flutter/material.dart';

import '../common/MyCheckBox.dart';
import '../common/MyPassword.dart';
import 'RegistrationScreen.dart';

class LoginScreen extends StatefulWidget {
  final bool isBackArrowVisible;
  final bool isTitleVisible;
  final bool isProfileVisible;

  const LoginScreen(
      {super.key,
      required this.isBackArrowVisible,
      required this.isTitleVisible,
      required this.isProfileVisible});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // For Validation we use this GlobalKey
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();

  bool _userLogin = false;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _userLogin = UserPreferences.getIsUserLoggedIn() ?? false;
  }

  // For Login Button Loader
  // ========== async await for make delay of task for some second and execute task after that.
  // Reference : https://www.youtube.com/watch?v=RAOoVvTQeAI

  Future<void> _onSubmit() async {
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 2), () {
      setState(() => {_isLoading = false});
      UserPreferences.setUserLoggedIn(true); // Store User LoggedIn flag
      UserPreferences.setEmailId(_email.text); // Store Email Id

      // pushReplacement to remove current Activity and launch new one.

      Navigator.pushReplacement(
        context,
        EnterExitRoute(
            exitPage: widget,
            enterPage: const Dashboard(
                isBackArrowVisible: false,
                isTitleVisible: false,
                isProfileVisible: true)),
      );
    });
  }

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
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Back Pressed"),
              ));
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
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // ============ SIGN IN
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.all(24.0),
                child: Text(
                  "Sign in " '$_userLogin',
                  style: const TextStyle(
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
                  validator: (value) {
                    RegExp regex = RegExp(r"""
^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""");
                    if (value == null || value.isEmpty) {
                      return "Please enter email";
                    } else if (!regex.hasMatch(value)) {
                      return "Invalid email address.";
                    }
                    return null;
                  },
                  enabled: _isLoading ? false : true,
                  controller: _email,
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(color: Color((0xE6969696))),
                  decoration: const InputDecoration(
                    errorMaxLines: 2,
                    errorStyle: TextStyle(color: Colors.yellow),
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
                  child: MyPassword(isLoading: _isLoading)),

              // ============ CHECKBOX REMEMBER ME AND FORGOT PASSWORD TEXT

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.only(
                        left: 14.0, right: 24.0, top: 2.0),
                    child: Wrap(
                      direction: Axis.horizontal,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: const [MyCheckBox(label: "Remember me")],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 0, right: 24, top: 2.0),
                    //apply padding to some sides only
                    child: TextButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("forgot password Clicked"),
                          ));

                          displayResetPassword(context);
                        },
                        child: const Text(
                          "forgot password",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Colors.green),
                        )),
                  )
                ],
              ),
              // ==== BUTTON
              Container(
                alignment: Alignment.center,
                padding:
                    const EdgeInsets.only(left: 24.0, right: 24.0, top: 24.0),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      minimumSize: const Size.fromHeight(48)),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _isLoading ? null : _onSubmit();
                    }
                  },
                  icon: _isLoading
                      ? Container(
                          width: 24,
                          height: 24,
                          padding: const EdgeInsets.all(2.0),
                          child: const CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 3,
                          ),
                        )
                      : const SizedBox.shrink(),
                  label: const Text(
                    'Sign In',
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
                    "Don't have an account yet? ",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.white),
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => const RegistrationScreen(
                      //           isBackArrowVisible: true,
                      //           isTitleVisible: false,
                      //           isProfileVisible: false)),
                      // );
                      Navigator.push(
                        context,
                        EnterExitRoute(
                            exitPage: widget,
                            enterPage: const RegistrationScreen(
                                isBackArrowVisible: true,
                                isTitleVisible: false,
                                isProfileVisible: false)),
                      );
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Colors.green),
                    ),
                  )
                ]),
              )
              // ======== FOOTER TEXT. DON'T HAVE AN ACCOUNT
              // Expanded(
              //   child: Align(
              //       alignment: FractionalOffset.bottomCenter,
              //       child: Padding(
              //         padding: const EdgeInsets.only(bottom: 10.0),
              //         child: Row(
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             children: [
              //               const Text(
              //                 "Don't have an account yet? ",
              //                 style: TextStyle(
              //                     fontWeight: FontWeight.w500,
              //                     fontSize: 14,
              //                     color: Colors.white),
              //               ),
              //               TextButton(
              //                 onPressed: () {
              //                   ScaffoldMessenger.of(context)
              //                       .showSnackBar(const SnackBar(
              //                     content: Text("Sign Up clicked"),
              //                   ));
              //                 },
              //                 child: const Text(
              //                   "Sign Up",
              //                   style: TextStyle(
              //                       fontWeight: FontWeight.w500,
              //                       fontSize: 14,
              //                       color: Colors.green),
              //                 ),
              //               )
              //             ]),
              //       )),
              // ),
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}


import 'package:first_flutter_app/auth/LoginScreen.dart';
import 'package:first_flutter_app/common/UserPreferences.dart';
import 'package:first_flutter_app/dashboard/Dashboard.dart';
import 'package:flutter/material.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserPreferences.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _userLogin = false;

  @override
  void initState() {
    super.initState();
    _userLogin = UserPreferences.getIsUserLoggedIn() ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Startup Name Generator',
        theme: ThemeData(
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.black,
              foregroundColor: Colors.green,
            ),
            primarySwatch: Colors.green,
            unselectedWidgetColor: Colors.white),
        home: _userLogin
            ? const Dashboard(
                isBackArrowVisible: false,
                isTitleVisible: false,
                isProfileVisible: true)
            : const LoginScreen(
                isBackArrowVisible: false,
                isTitleVisible: false,
                isProfileVisible: false));
  }
}

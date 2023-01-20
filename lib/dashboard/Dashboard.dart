import 'package:first_flutter_app/auth/LoginScreen.dart';
import 'package:first_flutter_app/common/UserPreferences.dart';
import 'package:first_flutter_app/dashboard/tabs/HomeScreen.dart';
import 'package:first_flutter_app/dashboard/tabs/MenuScreen.dart';
import 'package:first_flutter_app/dashboard/tabs/NutritionScreen.dart';
import 'package:first_flutter_app/dashboard/tabs/TrainerScreen.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  final bool isBackArrowVisible;
  final bool isTitleVisible;
  final bool isProfileVisible;

  const Dashboard(
      {super.key,
      required this.isBackArrowVisible,
      required this.isTitleVisible,
      required this.isProfileVisible});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white);

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(optionStyle: optionStyle),
    NutritionScreen(optionStyle: optionStyle),
    MenuScreen(optionStyle: optionStyle),
    TrainerScreen(optionStyle: optionStyle),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          backgroundColor: Colors.green,
          child: ListView(
            padding: EdgeInsets.zero,
            children: const [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Text(
                  "Inshape",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.white),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                title: Text(
                  "Account",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.white),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.scale,
                  color: Colors.white,
                ),
                title: Text(
                  "Measurement",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.white),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                title: Text(
                  "Settings",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.white),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.payment,
                  color: Colors.white,
                ),
                title: Text(
                  "Payment",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ),
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
                    // LOGOUT FROM THE APP AND LOAD LOGIN SCREEN
                    onPressed: () async {
                      UserPreferences.setUserLoggedIn(false);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen(
                                isBackArrowVisible: false,
                                isTitleVisible: false,
                                isProfileVisible: false)),
                      );
                    },
                    icon: const Icon(Icons.person_rounded),
                  ),
                ]
              : [],
        ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black38, spreadRadius: 0, blurRadius: 10),
              ],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
              child: BottomNavigationBar(
                backgroundColor: const Color.fromARGB(100, 150, 150, 150),
                type: BottomNavigationBarType.fixed,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home_filled),
                    label: "Home",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.local_dining),
                    label: 'Nutrition',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.fitness_center),
                    label: 'Menu',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.self_improvement),
                    label: 'Trainer',
                  ),
                ],
                currentIndex: _selectedIndex,
                selectedItemColor: Colors.green,
                onTap: _onItemTapped,
              ),
            )));
  }
}

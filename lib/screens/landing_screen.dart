import 'package:flutter/material.dart';
import 'package:loginnodejs/api/auth_api.dart';
import './profile_screen.dart';
import 'home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});
  static const String id = 'LandingPage';
  @override
  State<LandingScreen> createState() => _LandingScreen();
}

class _LandingScreen extends State<LandingScreen> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    homeScreen(),
    profileScreen(),
  ];

  void _onItemTapped(int index) async{
    if (index == 1) {
      await getUser();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      profileScreen.email = prefs.getString("email");
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.pink,
        onTap: _onItemTapped,
      ),
    );
  }
}
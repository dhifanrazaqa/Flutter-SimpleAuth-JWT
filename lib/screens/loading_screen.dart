import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'landing_screen.dart';
import 'signup_screen.dart';


class loadingScreen extends StatelessWidget {
  const loadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    checkToken() async{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("token");
      print(token);
      if (token != null) {
        Navigator.pushReplacementNamed(context, LandingScreen.id);
      } else {
        Navigator.pushReplacementNamed(context, SignUpSection.id);
      }
    }
    checkToken();
    return const Scaffold();
  }
}
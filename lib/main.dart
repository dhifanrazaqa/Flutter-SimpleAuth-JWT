import 'package:flutter/material.dart';
import 'screens/landing_screen.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/loading_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const loadingScreen(),
      routes: {
        SignUpSection.id:(context) => SignUpSection(),
        LandingScreen.id: (context) => const LandingScreen(),
        LoginSection.id:(context) => LoginSection()
      },
    );
  } 
}
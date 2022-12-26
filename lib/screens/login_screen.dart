import 'package:flutter/material.dart';
import 'package:loginnodejs/screens/signup_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../api/auth_api.dart';
import './landing_screen.dart';

class LoginSection extends StatelessWidget {
  static const String id = "LoginSection";
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black38,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 35, bottom: 40),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Log In",
                  style: TextStyle(color: Colors.white, fontSize: 50),
                  ),
                ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 35, bottom: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Email",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, bottom: 15),
              child: TextField(
                decoration: InputDecoration(
                  fillColor: const Color.fromARGB(255, 20, 20, 20),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                      const BorderSide(width: 2, color: Color.fromARGB(66, 155, 155, 155)),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                      const BorderSide(width: 2, color: Colors.pink),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  hintText: 'Email',
                  hintStyle: TextStyle(color: Colors.grey[600]),
                ),
                style: TextStyle(color: Colors.grey[300]),
                cursorColor: Colors.pink,
                cursorHeight: 20,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                    email = value;
                },
              )
            ),
            const Padding(
              padding: EdgeInsets.only(left: 35, bottom: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Password",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
              child: TextField(
                decoration: InputDecoration(
                  fillColor: const Color.fromARGB(255, 20, 20, 20),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                      const BorderSide(width: 2, color: Color.fromARGB(66, 155, 155, 155)),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                      const BorderSide(width: 2, color: Colors.pink),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  hintText: 'Password',
                  hintStyle: TextStyle(color: Colors.grey[600]),
                ),
                style: TextStyle(color: Colors.grey[300]),
                cursorColor: Colors.pink,
                cursorHeight: 20,
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                onChanged: (value) {
                    password = value;
                },
              )
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  minimumSize: const Size(double.infinity, 50),
                ),
                onPressed: () async {
                  await login(email, password);
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  String? token = prefs.getString("token");
                  print(token);
                  if (token != null) {
                    Navigator.of(context).pushReplacementNamed(LandingScreen.id);
                  }
                },
                child: const Text("Log In")
              ),
            ),
            Padding(
            padding: const EdgeInsets.only(left: 35,top: 10),
            child: Row(
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed(SignUpSection.id);
                    },
                    child: const Text('Sign Up', style: TextStyle(color: Colors.white),)
                  ),
                ],
              ),
            ),
          ],
        ),
      );
  }
}
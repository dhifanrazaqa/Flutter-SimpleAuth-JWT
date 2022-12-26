import 'package:flutter/material.dart';
import '../api/auth_api.dart';

class homeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(child: Text('Welcome', style: TextStyle(fontSize: 30),)),
    );
  }
}
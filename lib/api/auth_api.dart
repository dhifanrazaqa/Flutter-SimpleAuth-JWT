import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<void> signup(var email, var password) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String url = 'http://localhost:5000/api/v1/auth/signup';
  final response = await http.post(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'email': email,
      'password': password,
    }),
  );
  print(response.body);
  var parse = jsonDecode(response.body);
  await prefs.setString('token', parse["token"]);
}

Future<void> login(var email, var password) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String url = 'http://localhost:5000/api/v1/auth/login';
  final response = await http.post(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'email': email,
      'password': password,
    }),
  );
  var parse = jsonDecode(response.body);
  print(response.body);
  await prefs.setString('token', parse["token"]);
}

Future<void> getUser() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString("token");
  print(token);
  String url = 'http://localhost:5000/api/v1/auth/user';
  final response = await http.get(
    Uri.parse(url),
    headers:{"token": token ?? token.toString()},
  );

  final result = jsonDecode(response.body) as Map<String, dynamic>;
  await prefs.setString('email', result['user']['email']);
}
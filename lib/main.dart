import 'package:alumni_app_2/wrapper/main_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:alumni_app_2/screen1_login/ login_page/login_screen.dart';

void main() {
  runApp(_MyApp());
}

class _MyApp extends StatefulWidget {
  const _MyApp({super.key});
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<_MyApp> {
  bool _isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  // Check if user is already logged in
  void _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? loggedIn = prefs.getBool('isLoggedIn') ?? false;
    setState(() {
      _isLoggedIn = loggedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Persistent Login Example',
      // Decide the initial route based on login status
      home: _isLoggedIn ? const MainWrapper() : const Login(),
    );
  }
}
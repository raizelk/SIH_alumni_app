import 'package:flutter/material.dart';
import 'package:alumni_app_2/login_page/login_screen.dart';
import 'package:alumni_app_2/signup_page/signup_screen.dart';
import 'package:alumni_app_2/forget_password/forget_password_screen.dart';
import 'package:alumni_app_2/reset_password/reset_password_screen.dart'; // Import the ResetPassword screen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Alumni Connect App',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        primarySwatch: Colors.blue,
      ),
      // Use routes for navigation
      routes: {
        '/login': (context) => const Login(),
        '/signup': (context) => const SignUp(),
        '/forget-password': (context) => const ForgetPassword(),
        '/reset-password': (context) => const ResetPasswordScreen(), // Add ResetPassword route
      },
      home: const Login(), // Set the initial screen to Login
    );
  }
}

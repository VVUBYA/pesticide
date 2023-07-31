import 'package:flutter/material.dart';
import 'package:csdatabase/splash_screen.dart';
import 'package:csdatabase/home.dart';
import 'login.dart';
import 'package:firebase_core/firebase_core.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        //'/signup': (context) => SignupScreen(),

        //'/forgot_password': (context) => ForgotPasswordScreen(),
      },
    );
  }
}

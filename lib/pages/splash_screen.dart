import 'package:akademi_yanimda/pages/home.dart';
import 'package:akademi_yanimda/pages/main_page.dart/lessons_screen/lessons_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'auth_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
        Duration(seconds: 2),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
              return FirebaseAuth.instance.currentUser != null ? HomeBar() : AuthScreen();
            })));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Image(image: AssetImage("assets/images/logo.png"))),
    );
  }
}

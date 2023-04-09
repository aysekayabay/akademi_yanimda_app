import 'package:akademi_yanimda/pages/home.dart';
import 'package:akademi_yanimda/pages/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'auth_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late int isViewed;

  _getWelcomeInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isViewed = prefs.getInt('welcome') ?? 0;
  }

  @override
  void initState() {
    super.initState();
    _getWelcomeInfo();
    Future.delayed(
        Duration(seconds: 2),
        () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
              return isViewed == 1 ? (FirebaseAuth.instance.currentUser != null ? HomeBar() : AuthScreen()) : WelcomeScreen();
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

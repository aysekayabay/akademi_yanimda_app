import 'package:akademi_yanimda/pages/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

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
              return FirebaseAuth.instance.currentUser != null ? HomePage(title: 'Akademi Yanımda') : LoginScreen();
            })));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("AKADEMİ YANINDA"),
      ),
    );
  }
}

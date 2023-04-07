import 'package:akademi_yanimda/pages/home_screen.dart';
import 'package:akademi_yanimda/services/auth_service.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  navigateToHome() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) {
        return HomePage(title: "Akademi Yanımda");
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  await signInWithGoogle();
                  navigateToHome();
                },
                child: Text("Google"))
          ], //ilk sayfa
        ),
      ),
    );
  }
}

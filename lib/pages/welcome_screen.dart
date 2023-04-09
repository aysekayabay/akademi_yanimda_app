import 'package:akademi_yanimda/pages/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({super.key}) {}

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  _storeWelcomeInfo() async {
    int isViewed = 1;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('welcome', isViewed);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
          Image.asset('assets/images/logo_t.png', width: 200),
          SizedBox(height: 50),
          Image.asset('assets/images/welcome.png', width: 300),
          SizedBox(height: 50),
          MainButton(
            isFilled: true,
            title: "Hoşgeldiniz",
            onTap: () async {
              await _storeWelcomeInfo();
              Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) {
                  return AuthScreen();
                },
              ));
            },
          ),
        ]),
      ),
    );
  }
}

class PaddingItems {
  static const EdgeInsets horizontalPadding = EdgeInsets.symmetric(horizontal: 20);
}

class ButtonHeights {
  static const buttonNormalHeight = 50.0;
}

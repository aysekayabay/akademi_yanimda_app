import 'package:akademi_yanimda/pages/auth_screen.dart';
import 'package:akademi_yanimda/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final String title = 'Akademi Yanında';
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(FirebaseAuth.instance.currentUser!.displayName!),
          ElevatedButton(
              onPressed: () async {
                await signOutWithGoogle();
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) {
                    return AuthScreen();
                  },
                ));
              },
              child: Text('Çıkış yap'))
        ],
      ),
    );
  }
}

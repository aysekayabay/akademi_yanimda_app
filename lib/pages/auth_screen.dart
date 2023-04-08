import 'package:akademi_yanimda/pages/home_screen.dart';
import 'package:akademi_yanimda/pages/login_screen.dart';
import 'package:akademi_yanimda/pages/register_screen.dart';
import 'package:akademi_yanimda/utilities/styles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  navigateToHome() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) {
        return HomePage();
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HeaderText(title: "Hesabınız var mı?", bottomPadding: 10),
            SubHeaderText(title: "Gelişmeye devam et", bottomPadding: 20),
            MainButton(
              isFilled: true,
              title: "Giriş Yap",
              padding: EdgeInsets.symmetric(vertical: 20),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen()));
              },
            ),
            Divider(height: 80),
            HeaderText(title: "Buralarda yeni misin?", bottomPadding: 10),
            SubHeaderText(title: "Öğrenmeye hemen başla", bottomPadding: 20),
            MainButton(
                isFilled: false,
                padding: EdgeInsets.symmetric(vertical: 20),
                title: "Kayıt Ol",
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegisterScreen()));
                }),
            SizedBox(height: 50),
            GoogleSignButton()
          ],
        ),
      ),
    );
  }

  Widget GoogleSignButton() {
    return ElevatedButton(
        onPressed: () async {
          await signInWithGoogle();
          String uid = FirebaseAuth.instance.currentUser!.uid;
          await FirebaseFirestore.instance.collection('kullanicilar').doc(uid).set(
            {'girisYaptiMi': true, 'sonGirisTarihi': FieldValue.serverTimestamp()},
            SetOptions(merge: true),
          );
          navigateToHome();
        },
        child: Text("Google ile Giriş Yap"));
  }
}

class SubHeaderText extends StatelessWidget {
  final double topPadding;
  final double bottomPadding;
  final String title;
  const SubHeaderText({
    super.key,
    required this.title,
    this.topPadding = 0,
    this.bottomPadding = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topPadding, bottom: bottomPadding),
      child: Text(title, style: Styles.subHeaderStyle),
    );
  }
}

class HeaderText extends StatelessWidget {
  final String title;
  final double topPadding;
  final double bottomPadding;
  const HeaderText({
    super.key,
    required this.title,
    this.topPadding = 0,
    this.bottomPadding = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topPadding, bottom: bottomPadding),
      child: Text(title, style: Styles.headerStyle),
    );
  }
}

class MainButton extends StatelessWidget {
  final bool isFilled;
  final void Function()? onTap;
  final String title;
  final EdgeInsetsGeometry? padding;
  const MainButton({
    super.key,
    this.padding,
    required this.isFilled,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: padding,
        decoration: BoxDecoration(
          border: isFilled ? null : Border.all(color: Styles.buttonColor),
          color: isFilled ? Styles.buttonColor : Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Center(
          child: Text(
            title,
            style: Styles.buttonTextStyle.copyWith(color: isFilled ? Colors.white : Styles.buttonColor),
          ),
        ),
      ),
    );
  }
}

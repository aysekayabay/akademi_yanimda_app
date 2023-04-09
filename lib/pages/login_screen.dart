import 'package:akademi_yanimda/pages/auth_screen.dart';
import 'package:akademi_yanimda/pages/home.dart';
import 'package:akademi_yanimda/pages/register_screen.dart';
import 'package:akademi_yanimda/services/auth_service.dart';
import 'package:flutter/material.dart';

import '../utilities/styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  navigateToHome() {
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        return HomeBar();
      },
    ));
  }

  bool isSaving = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text("Giriş Yap", style: Styles.headerStyle),
                SizedBox(height: MediaQuery.of(context).size.height / 6),
                CustomAuthField(controller: mailController, label: 'Email', onSaved: (p0) {}),
                CustomAuthField(controller: passwordController, label: 'Şifre', onSaved: (p0) {}),
                SizedBox(height: 50),
                isSaving
                    ? Center(child: CircularProgressIndicator())
                    : InkWell(
                        onTap: () async {
                          setState(() {
                            isSaving = true;
                          });
                          int success = await AuthService.instance.login(context, mailController.text, passwordController.text);
                          if (success == 1) {
                            setState(() {
                              isSaving = false;
                            });
                            navigateToHome();
                          }
                          setState(() {
                            isSaving = false;
                          });
                        },
                        child: MainButton(isFilled: true, title: "Giriş Yap"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:akademi_yanimda/pages/register_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../services/auth_service.dart';
import '../utilities/styles.dart';
import 'auth_screen.dart';
import 'home.dart';

class SettingNicknameScreen extends StatefulWidget {
  const SettingNicknameScreen({super.key});

  @override
  State<SettingNicknameScreen> createState() => SettingNicknameScreenState();
}

class SettingNicknameScreenState extends State<SettingNicknameScreen> {
  final _formKey = GlobalKey<FormState>();
  final nicknameController = TextEditingController();
  final Map<String, dynamic> registerForm = {};
  bool isSaving = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(children: [
              Text("Son Bir Adım", style: Styles.headerStyle),
              SizedBox(height: MediaQuery.of(context).size.height / 6),
              CustomAuthField(
                  label: "Kullanıcı Adı",
                  validator: (p0) {
                    if (p0?.isNotEmpty != true || (p0?.isNotEmpty == true && p0!.length < 6)) {
                      return 'Girdiğiniz şifre en az 6 karakter içermelidir.';
                    }
                    return null;
                  },
                  controller: nicknameController,
                  onSaved: (newValue) {
                    registerForm['password'];
                  }),
              SizedBox(height: 100),
              isSaving
                  ? Center(child: CircularProgressIndicator())
                  : InkWell(
                      onTap: () async {
                        setState(() {
                          isSaving = true;
                        });
                        final formState = _formKey.currentState;
                        if (formState == null) return;

                        if (formState.validate()) {
                          formState.save();
                          print(registerForm);
                        }
                        User user = FirebaseAuth.instance.currentUser!;
                        FirebaseFirestore.instance.collection('users').doc(user.uid).set({'nickName': nicknameController.text}, SetOptions(merge: true));
                        isSaving = false;
                        Navigator.pushReplacement(context, MaterialPageRoute(
                          builder: (context) {
                            return HomeBar();
                          },
                        ));
                      },
                      child: MainButton(isFilled: true, title: "Başla")),
            ]),
          ),
        ),
      ),
    );
  }
}

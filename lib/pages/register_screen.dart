import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> registerForm = {};
  TextEditingController fullnameController = TextEditingController();
  TextEditingController nicknameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  bool isSaving = false;
  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(fontFamily: 'Poppins', color: Color(0xff525F7F), fontSize: 18, fontWeight: FontWeight.w500);
    var hintStyle = TextStyle(color: Color(0xffA1B2CF), fontFamily: 'Poppins', fontWeight: FontWeight.w900, fontSize: 16);
    var buttonDecoration = BoxDecoration(color: Color(0xff686BFF), borderRadius: BorderRadius.all(Radius.circular(10)));
    var buttonTextStyle = TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500);
    var headerStyle = TextStyle(color: Color(0xff525F7F), fontFamily: 'Poppins', fontWeight: FontWeight.w700, fontSize: 25);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: Text(
                "Kayıt Ol",
                style: headerStyle,
              ),
            ),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(children: [
                  TextFormField(
                    style: textStyle,
                    controller: fullnameController,
                    decoration: InputDecoration(
                        label: Text(
                      "Ad Soyad",
                      style: hintStyle,
                    )),
                    onSaved: (newValue) {
                      registerForm['fullName'];
                    },
                  ),
                  SizedBox(height: 5),
                  TextFormField(
                    style: textStyle,
                    controller: nicknameController,
                    decoration: InputDecoration(
                        label: Text(
                      "Kullanıcı Adı",
                      style: hintStyle,
                    )),
                    onSaved: (newValue) {
                      registerForm['nickName'];
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: TextFormField(
                      style: textStyle,
                      controller: mailController,
                      decoration: InputDecoration(
                          label: Text(
                        "Mail",
                        style: hintStyle,
                      )),
                      onSaved: (newValue) {
                        registerForm['mail'];
                      },
                    ),
                  ),
                  TextFormField(
                    style: textStyle,
                    controller: passwordController,
                    decoration: InputDecoration(
                        label: Text(
                      "Şifre",
                      style: hintStyle,
                    )),
                    onSaved: (newValue) {
                      registerForm['password'];
                    },
                  ),
                  SizedBox(height: 50),
                  isSaving
                      ? Center(child: CircularProgressIndicator())
                      : InkWell(
                          onTap: () {
                            final formState = _formKey.currentState;
                            if (formState == null) return;

                            if (formState.validate()) {
                              formState.save();
                              print(registerForm);
                            }
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.symmetric(vertical: 20),
                            decoration: buttonDecoration,
                            child: Center(
                              child: Text(
                                "Kayıt Ol",
                                style: buttonTextStyle,
                              ),
                            ),
                          ))
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Styles {
  static const buttonDecoration = BoxDecoration(color: buttonColor, borderRadius: BorderRadius.all(Radius.circular(10)));
  static const buttonTextStyle = TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500);
  static const headerStyle = TextStyle(color: darkGrey, fontFamily: 'Poppins', fontWeight: FontWeight.w700, fontSize: 25);
  static const subHeaderStyle = TextStyle(color: Color(0xff98A3C7), fontFamily: 'Poppins', fontWeight: FontWeight.w900, fontSize: 18);
  static const darkGrey = Color(0xff525F7F);
  static const classicTextStyle = TextStyle(color: darkGrey, fontFamily: 'Poppins', fontWeight: FontWeight.w500, fontSize: 18);
  static const buttonColor = Color(0xff686BFF);
  static const hintStyle = TextStyle(fontFamily: 'Poppins', color: Color(0xffA1B2CF), fontSize: 16, fontWeight: FontWeight.w900);
}

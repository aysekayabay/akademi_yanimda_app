import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardInfo {
  static const String BASLIK = "Oyun ve Uygulama Akademisi";

  static const List<String> DERS_ADI = [
    "Flutter",
    "Unity",
    "Oyun Sanatı",
    "Girişimcilik",
    "İngilizce"
  ];
  static TextStyle BASLIK_STYLE =
      GoogleFonts.rubik(fontStyle: FontStyle.italic, color: Colors.white);
  static TextStyle AD_STYLE = TextStyle(
      fontFamily: "Poppins", fontSize: 18, fontWeight: FontWeight.w900);
  static ButtonStyle CARD_BUTTON = ElevatedButton.styleFrom(
      backgroundColor: Colors.white, side: BorderSide(width: 5));
  static TextStyle KONU_BASLIK = GoogleFonts.rubik(
      color: Colors.black87, fontSize: 24, fontWeight: FontWeight.w600);
  static TextStyle KONU_BASLIK1 = GoogleFonts.rubik(
      color: Colors.indigo, fontSize: 20, fontWeight: FontWeight.w500);
  static TextStyle KONU_ADI = GoogleFonts.rubik(
      color: Colors.indigo, fontSize: 18, fontWeight: FontWeight.w400);
}

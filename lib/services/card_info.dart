import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardInfo {
  static const String BASLIK = "Oyun ve Uygulama Akademisi";
  static const List<String> DERS_ADI = ["Flutter", "Unity", "Girişimcilik", "İngilizce"];
  static TextStyle BASLIK_STYLE = GoogleFonts.rubik(fontStyle: FontStyle.italic, color: Colors.white);
  static TextStyle AD_STYLE = TextStyle(fontFamily: "Poppins", fontSize: 18, fontWeight: FontWeight.w900);
  static ButtonStyle CARD_BUTTON = ElevatedButton.styleFrom(backgroundColor: Colors.white, side: BorderSide(width: 5));
}

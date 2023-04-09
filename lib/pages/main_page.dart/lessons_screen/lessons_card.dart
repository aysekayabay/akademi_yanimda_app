// ignore_for_file: must_be_immutable

import 'package:akademi_yanimda/pages/main_page.dart/lessons_screen/lesson_title.dart';
import 'package:akademi_yanimda/services/card_info.dart';
import 'package:akademi_yanimda/services/youtube_service.dart';
import 'package:flutter/material.dart';

class LessonCard extends StatelessWidget {
  LessonCard(
      {super.key, required this.name_count, required this.arkaplan_rengi,});
  late int name_count;
  late Color arkaplan_rengi;
  @override
  Widget build(BuildContext context) {
    debugPrint(CardInfo.DERS_ADI[name_count]);

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        width: 300,
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                blurRadius: 5,
                spreadRadius: 3,
                color: Colors.grey.shade400,
                blurStyle: BlurStyle.normal)
          ],
          color: arkaplan_rengi,
        ),
        child: Stack(
          children: [
            Positioned(
              child: Text(
                CardInfo.BASLIK,
                style: CardInfo.BASLIK_STYLE,
              ),
              top: 15,
              right: 90,
              left: 15,
            ),
            Positioned(
              child: Text(
                CardInfo.DERS_ADI[name_count],
                style: CardInfo.AD_STYLE,
              ),
              top: 60,
              right: 120,
              left: 15,
            ),
            Positioned(
              child: ElevatedButton(
                  child: Text(
                    "Başla",
                    style: TextStyle(color: Colors.indigo.shade300),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: StadiumBorder(),
                      fixedSize: Size(60, 20)),
                  onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => LessonTitle(konu:YoutubeService.Konular[name_count] ),));}),
              top: 95,
              right: 140,
              left: 15,
            ),
            Positioned(
              child: Container(
                margin: EdgeInsets.only(left: 30, right: 30),
                width: 10,
                child: Center(
                    child: Text(
                  "01/30",
                  style: TextStyle(color: Colors.white),
                )),
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              top: 15,
              right: -20,
              left: 160,
            ),
            Positioned(
              child: Image(
                  image: AssetImage(
                      "assets/images/${CardInfo.DERS_ADI[name_count]}.jpg")),
              top: 60,
              right: 30,
              left: 150,
            ),
          ],
        ),
      ),
    );
  }
}

// ignore_for_file: must_be_immutable

import 'package:akademi_yanimda/services/card_info.dart';
import 'package:akademi_yanimda/utilities/styles.dart';
import 'package:flutter/material.dart';

class LessonCard extends StatelessWidget {
  LessonCard({super.key, required this.name_count, required this.arkaplan_rengi});
  late int name_count;
  late Color arkaplan_rengi;
  @override
  Widget build(BuildContext context) {
    debugPrint(CardInfo.DERS_ADI[name_count]);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.0),
      child: Container(
        padding: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/shadow.png"), alignment: Alignment.bottomRight, scale: 0.8),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [BoxShadow(blurRadius: 5, spreadRadius: 3, color: Colors.grey.shade400, blurStyle: BlurStyle.normal)],
          color: arkaplan_rengi,
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      CardInfo.BASLIK,
                      style: CardInfo.BASLIK_STYLE,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                      child: Center(child: Text("01/30", style: TextStyle(color: Colors.white))),
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          CardInfo.DERS_ADI[name_count],
                          style: CardInfo.AD_STYLE,
                        ),
                        SizedBox(height: 10),
                        Container(
                          decoration: ShapeDecoration(shape: StadiumBorder(), color: Colors.white),
                          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                          child: Text(
                            "Başla",
                            style: TextStyle(color: Styles.darkPurp),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 20, top: 20),
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Image(
                        image: AssetImage("assets/images/${CardInfo.DERS_ADI[name_count]}.png"),
                        height: 90,
                        width: 90,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

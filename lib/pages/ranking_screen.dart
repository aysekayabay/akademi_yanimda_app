import 'package:akademi_yanimda/utilities/styles.dart';
import 'package:flutter/material.dart';

class RankingScreen extends StatefulWidget {
  const RankingScreen({super.key});

  @override
  State<RankingScreen> createState() => _RankingScreenState();
}

class _RankingScreenState extends State<RankingScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: <Color>[
          Color(0xff6F66FF),
          Color(0xff001251),
        ],
        tileMode: TileMode.mirror,
      )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Header(),
          rankHeader(),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 20),
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color(0xff686BFF), Color(0xff00061D)])),
              child: Column(
                children: [
                  rankingItem(fullName: "Ad Soyad", no: "No", puan: "Puan", header: true),
                  SizedBox(height: 10),
                  rankingItem(fullName: "Ayşe", no: "4", puan: "18", header: false),
                  rankingItem(fullName: "Mert", no: "5", puan: "10", header: false),
                  rankingItem(fullName: "Canan", no: "6", puan: "7", header: false),
                  rankingItem(fullName: "Süleyman", no: "7", puan: "5", header: false),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget Header() {
    return Padding(
      padding: EdgeInsets.only(left: 30, top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Puan Tablosu", style: Styles.rankHeaderStyle),
          Text("Oyun ve Uygulama Akademisi", style: Styles.rankSubHeaderStyle),
        ],
      ),
    );
  }

  Row rankHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 40),
              padding: EdgeInsets.all(20) + EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/polygon2.png"))),
              child: Text("2nd", style: Styles.rankingNum),
            ),
            degreeContainer(title: "@mert", color: Styles.rankGrey),
            Text("2810", style: Styles.buttonTextStyle.copyWith(fontWeight: FontWeight.w800))
          ],
        ),
        Column(
          children: [
            Container(
              padding: EdgeInsets.all(40),
              decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/polygon1.png"))),
              child: Text("1st", style: Styles.rankingNum),
            ),
            degreeContainer(title: "@mert", color: Styles.rankYellow),
            Text("2810", style: Styles.buttonTextStyle.copyWith(fontWeight: FontWeight.w800))
          ],
        ),
        Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 40),
              padding: EdgeInsets.all(20) + EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/polygon3.png"))),
              child: Text("3rd", style: Styles.rankingNum),
            ),
            degreeContainer(title: "@mert", color: Styles.rankOrange),
            Text("2810", style: Styles.buttonTextStyle.copyWith(fontWeight: FontWeight.w800)),
          ],
        ),
      ],
    );
  }
}

class rankingItem extends StatelessWidget {
  final String no;
  final String fullName;
  final String puan;
  final bool header;
  rankingItem({
    super.key,
    required this.header,
    required this.no,
    required this.puan,
    required this.fullName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            no,
            style: Styles.rankingTextStyle.copyWith(fontWeight: header ? FontWeight.w900 : FontWeight.w500, fontSize: header ? 16 : 14),
          ),
          Text(
            fullName,
            style: Styles.rankingTextStyle.copyWith(fontWeight: header ? FontWeight.w900 : FontWeight.w500),
          ),
          Text(
            puan,
            style: Styles.rankingTextStyle.copyWith(fontWeight: header ? FontWeight.w900 : FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

class degreeContainer extends StatelessWidget {
  final String title;
  final Color? color;
  const degreeContainer({
    super.key,
    required this.title,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 6),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: ShapeDecoration(shape: StadiumBorder(), color: color),
        child: Text(
          title,
          style: Styles.rankingTextStyle,
        ));
  }
}

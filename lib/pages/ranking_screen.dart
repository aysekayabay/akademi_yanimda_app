import 'package:akademi_yanimda/utilities/styles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RankingScreen extends StatefulWidget {
  const RankingScreen({super.key});

  @override
  State<RankingScreen> createState() => _RankingScreenState();
}

class _RankingScreenState extends State<RankingScreen> {
  Color baseLinearLightBlue = Color(0xff6F66FF);
  Color baseLinearDarkBlue = Color(0xff001251);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
      stream: FirebaseFirestore.instance.collection('users').orderBy('point').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final rankList = snapshot.data!.docs.reversed.toList();
          var contLinearLightBlue = Color(0xff686BFF);
          var contLinearDarkBlue = Color(0xff00061D);
          return Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                baseLinearLightBlue,
                baseLinearDarkBlue,
              ],
              tileMode: TileMode.mirror,
            )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Header(),
                rankList.length >= 3 ? rankHeader(rankList) : SizedBox(),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                        gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [contLinearLightBlue, contLinearDarkBlue])),
                    child: Column(
                      children: [
                        rankingItem(fullName: "Ad Soyad", no: "No", puan: "Puan", header: true),
                        SizedBox(height: 10),
                        Column(
                          children: List.generate(rankList.length >= 3 ? (rankList.length - 3) : 0, (index) {
                            return rankingItem(header: false, no: (index + 4).toString(), puan: rankList[index + 3]['point'].toString(), fullName: rankList[index + 3]['nickName'] ?? '');
                          }),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    ));
  }

  Widget rankHeader(List<QueryDocumentSnapshot<Map<String, dynamic>>> rankList) {
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
            degreeContainer(title: rankList[1]['nickName'], color: Styles.rankGrey),
            Text(rankList[1]['point'].toString(), style: Styles.buttonTextStyle.copyWith(fontWeight: FontWeight.w800))
          ],
        ),
        Column(
          children: [
            Container(
              padding: EdgeInsets.all(40),
              decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/polygon1.png"))),
              child: Text("1st", style: Styles.rankingNum),
            ),
            degreeContainer(title: rankList[0]['nickName'], color: Styles.rankYellow),
            Text(rankList[0]['point'].toString(), style: Styles.buttonTextStyle.copyWith(fontWeight: FontWeight.w800))
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
            degreeContainer(title: rankList[2]['nickName'], color: Styles.rankOrange),
            Text(rankList[2]['point'].toString(), style: Styles.buttonTextStyle.copyWith(fontWeight: FontWeight.w800)),
          ],
        ),
      ],
    );
  }

  Widget Header() {
    return Padding(
      padding: EdgeInsets.only(left: 30, top: 40),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 2.0, right: 8),
            child: InkWell(onTap: () => Navigator.of(context).pop(), child: Icon(Icons.arrow_back_outlined, color: Colors.white)),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Puan Tablosu", style: Styles.rankHeaderStyle),
              Text("Oyun ve Uygulama Akademisi", style: Styles.rankSubHeaderStyle),
            ],
          ),
        ],
      ),
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
          "@" + title,
          style: Styles.rankingTextStyle,
        ));
  }
}

import 'package:akademi_yanimda/pages/main_page.dart/collections_screen/collection_card.dart';
import 'package:akademi_yanimda/services/card_info.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CollectionScreen extends StatefulWidget {
  const CollectionScreen({super.key});

  @override
  State<CollectionScreen> createState() => _CollectionScreenState();
}

class _CollectionScreenState extends State<CollectionScreen> {
  final _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
        icon: Icon(Icons.close),
        onPressed: () => Navigator.of(context).pop(),
      )),
      body: Column(
        children: [
          SizedBox(height: 40),
          Text("Koleksiyonum", style: GoogleFonts.inter(color: Colors.grey.shade800, fontSize: 22, fontWeight: FontWeight.w900)),
          SizedBox(
            height: 40,
          ),
          SizedBox(
            height: 250,
            child: PageView(controller: _controller, scrollDirection: Axis.horizontal,children: [
              CollectionCard(
                title: "Hazırsan Başlıyoruz",
                subtitle: "ilk soru cevabın",
                resim: "card1",
                topPositioned: 160,
                leftPositioned: 115,
              ),
              CollectionCard(
                title: "Flatter Hastası",
                subtitle: "20 Soru Sordun",
                resim: "card2",
                topPositioned: 160,
                leftPositioned: 120,
              ),
              CollectionCard(
                title: "Başarı Koleksiyonu",
                subtitle: "Bu Haftanın Birincisi",
                resim: "card3",
                topPositioned: 160,
                leftPositioned: 115,
              ),
              CollectionCard(
                title: "  Topluluğu Katkı",
                subtitle: "5 Soru Cevapladım",
                resim: "card4",
                topPositioned: 160,
                leftPositioned: 120,
              ),
              CollectionCard(
                title: "Kurnaz Bursiyer",
                subtitle: "Kolay Yolu Buldun",
                resim: "card5",
                topPositioned: 160,
                leftPositioned: 120,
              ),
            ]),
          ),
          SizedBox(height: 45),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                konular(0),
                konular(1),
                konular(2),
                konular(3),
                konular(4),
              ],
            ),
          ),
          SizedBox(height: 20),
          SmoothPageIndicator(
              controller: _controller,
              count: 5,
              effect: ExpandingDotsEffect(
                  activeDotColor: Colors.tealAccent.shade400,
                  dotHeight: 10,
                  dotWidth: 10)),
        ],
      ),
    );
  }
}

Padding konular(sira) {
  String konu = CardInfo.DERS_ADI[sira];

  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Text(
      konu,
      style: GoogleFonts.inter(
        fontSize: 14,
        color: Colors.black45,
        fontWeight: FontWeight.w800,
      ),
    ),
  );
}

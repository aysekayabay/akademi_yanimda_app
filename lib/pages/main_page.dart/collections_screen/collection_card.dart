import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class CollectionCard extends StatelessWidget {
  String title;
  String subtitle;
  String resim;
  double topPositioned;
  double leftPositioned;
  CollectionCard(
      {super.key,
      required this.topPositioned,
      required this.leftPositioned,
      required this.title,
      required this.subtitle,
      required this.resim});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Positioned(
            top: topPositioned,
            left: leftPositioned,
            child: Center(
              child: Column(
                children: [
                  Text(
                    title,
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    alignment: Alignment.center,
                    width: 140,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white)),
                      onPressed: () {},
                      child: Row(
                        children: [
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Koleksiyonum",
                            style: GoogleFonts.inter(
                              color: Colors.black87,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(width: 4),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.black,
                            size: 15,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      width: 220,
      height: 220,
      decoration: BoxDecoration(
          image:
              DecorationImage(image: AssetImage("assets/images/${resim}.png"))),
    );
  }
}

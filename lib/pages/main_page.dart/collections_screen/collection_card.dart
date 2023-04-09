import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class CollectionCard extends StatelessWidget {
     String title;
    String subtitle;
    String resim;
   CollectionCard({super.key,required this.title,required this.subtitle,required this.resim});

  @override
  Widget build(BuildContext context) {
 
    return Container(
      child: Stack(
        children: [
          Positioned(
            child: Text(
              title,
              style: GoogleFonts.inter(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            top: 135,
            left: 34,
          ),
          Positioned(
            child: Text(
              subtitle,
              style: GoogleFonts.inter(
                fontSize: 12,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
            top: 155,
            left: 70,
          ),
          Positioned(
            child: Container(alignment: Alignment.center,
              width: 140,
              child: ElevatedButton(
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white)),
                onPressed: () {},
                child: Row(
                  children: [
                    SizedBox(width: 5,),
                    Text(
                      "Koleksiyonum",
                      style: GoogleFonts.inter(
                        color: Colors.black87,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(width: 4),
                    Icon(Icons.arrow_forward,color: Colors.black,size: 15,)
                  ],
                ),
              ),
            ),
            top: 180,
            left: 42,
          )
        ],
      ),
      width: 220,
      height: 220,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/${resim}.png"))),
    );
  }
}

import 'package:akademi_yanimda/pages/main_page.dart/lessons_screen/lessons_screen.dart';
import 'package:akademi_yanimda/pages/welcome_screen.dart';
import 'package:akademi_yanimda/pages/welcome_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget{
  const WelcomeScreen ({super.key}) {
}
  @override
  Widget build(BuildContext context) {
    
    return  Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body:Padding(
        padding: PaddingItems.horizontalPadding,
        child: Column(
          children: [Image.asset('assets/images/logo.jpg.png')
          ]),
      ),
      const Spacer(),
      
      ElevatedButton(onPressed: () {},
      child: const SizedBox (height:ButtonHeights.buttonNormalHeight, child : Center(child:Text('Hoşgeldiniz' ),),)
      
    )
)
  }
}

class PaddingItems {
  static const EdgeInsets horizontalPadding = EdgeInsets.symmetric(horizontal: 20);
}

class ButtonHeights {
  static const buttonNormalHeight=50;
}

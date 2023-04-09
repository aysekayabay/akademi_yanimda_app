import 'package:akademi_yanimda/models/lesson_model.dart';
import 'package:akademi_yanimda/pages/home.dart';
import 'package:akademi_yanimda/pages/messages_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoContent extends StatefulWidget {
  Baslik baslik;
  VideoContent({super.key, required this.baslik});

  @override
  State<VideoContent> createState() => _VideoContentState();
}

class _VideoContentState extends State<VideoContent> {
  late final videoURL = widget.baslik.video_link;
  late YoutubePlayerController _controller;
  @override
  void initState() {
    super.initState();
    final videoID = YoutubePlayer.convertUrlToId(videoURL);
    _controller = YoutubePlayerController(initialVideoId: videoID!, flags: YoutubePlayerFlags(autoPlay: false, mute: true, isLive: false, controlsVisibleAtStart: true));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.close)),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(children: [
              Text(
                widget.baslik.konu,
                style: GoogleFonts.inter(
                  fontSize: 24,
                  color: Colors.black54,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(boxShadow: [BoxShadow(blurRadius: 10, spreadRadius: 4, color: Colors.black54)]),
                  child: YoutubePlayer(
                    controller: _controller,
                    showVideoProgressIndicator: true,
                    actionsPadding: EdgeInsets.all(10),
                  ),
                ),
              ),
              SizedBox(height: 40),
              Container(
                width: 320,
                height: 60,
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return MessagesPage();
                    },
                  )),
                  child: Text(
                    "Eğitmene Soru Sor",
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      shadowColor: Colors.black, elevation: 16, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), backgroundColor: Color.fromARGB(255, 111, 77, 190)),
                ),
              ),
              SizedBox(height: 20),
              // Container(
              //   width: 320,
              //   height: 60,
              //   child: ElevatedButton(
              //     onPressed: () {},
              //     child: Text(
              //       "Topluluğa Soru Sor",
              //       style: GoogleFonts.inter(
              //         fontSize: 16,
              //         color: Colors.white,
              //         fontWeight: FontWeight.w500,
              //       ),
              //     ),
              //     style: ElevatedButton.styleFrom(
              //         shadowColor: Colors.black, elevation: 16, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), backgroundColor: Color.fromARGB(255, 111, 77, 190)),
              //   ),
              // ),
              SizedBox(width: 15),
              Center(
                child: Container(
                  width: 160,
                  height: 160,
                  decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/akademi_yanimda.png"))),
                ),
              ),
            ]),
          ),
        ));
  }
}

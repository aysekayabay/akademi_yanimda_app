import 'package:akademi_yanimda/services/youtube_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoContent extends StatefulWidget {
  const VideoContent({super.key});

  @override
  State<VideoContent> createState() => _VideoContentState();
}

class _VideoContentState extends State<VideoContent> {
  final videoURL =
      "https://www.youtube.com/watch?v=RKwJwCaaFec&ab_channel=OyunveUygulamaAkademisi";
  late YoutubePlayerController _controller;
  @override
  void initState() {
    super.initState();
    final videoID = YoutubePlayer.convertUrlToId(videoURL);
    _controller = YoutubePlayerController(
        initialVideoId: videoID!,
        flags: YoutubePlayerFlags(
            autoPlay: false,
            mute: true,
            isLive: false,
            controlsVisibleAtStart: true));
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
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.close)),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 30),
            Text(
              "Başlık buraya gelecek",
              style: GoogleFonts.inter(
                fontSize: 18,
                color: Colors.black87,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      blurRadius: 10, spreadRadius: 4, color: Colors.black54)
                ]),
                child: YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true,
                  actionsPadding: EdgeInsets.all(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 280,
              height: 45,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Eğitmene Soru Sor",
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    shadowColor: Colors.black,
                    elevation: 16,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    backgroundColor: Color.fromARGB(255, 111, 77, 190)),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 280,
              height: 45,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Topluluğa Soru Sor",
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    shadowColor: Colors.black,
                    elevation: 16,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    backgroundColor: Color.fromARGB(255, 111, 77, 190)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:akademi_yanimda/services/youtube_service.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoContent extends StatefulWidget {
  const VideoContent({super.key});

  @override
  State<VideoContent> createState() => _VideoContentState();
}

class _VideoContentState extends State<VideoContent> {
  final videoURL = YoutubeService.Konular[0].Basliklar[1].toString();
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
      body: Center(
        child: Column(
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                    onPressed: () {}, icon: Icon(Icons.keyboard_arrow_left))),
            SizedBox(
              height: 5,
            ),
            YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              actionsPadding: EdgeInsets.all(10),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        backgroundColor: Colors.purple.shade600,
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}

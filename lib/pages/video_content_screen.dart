import 'package:akademi_yanimda/services/youtube_service.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoContent extends StatefulWidget {
  const VideoContent({super.key});

  @override
  State<VideoContent> createState() => _VideoContentState();
}

class _VideoContentState extends State<VideoContent> {
  final videoURL = YoutubeService.flutter[1];
   late YoutubePlayerController _controller;
  @override
  void initState() {
    final videoID = YoutubePlayer.convertUrlToId(videoURL);
    _controller = YoutubePlayerController(
        initialVideoId: videoID!,
        flags: YoutubePlayerFlags(autoPlay: false, mute: true, isLive: false,controlsVisibleAtStart: true));
  }
  @override
  void dispose() {
_controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("buraya geri butonu gelecek"),
            SizedBox(
              height: 10,
            ),
            YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              actionsPadding: EdgeInsets.all(10),
            )
          ],
        ),
      ),
    );
  }
}

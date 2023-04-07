import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class VideoContent extends StatefulWidget {
  const VideoContent({super.key});

  @override
  State<VideoContent> createState() => _VideoContentState();
}

class _VideoContentState extends State<VideoContent> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
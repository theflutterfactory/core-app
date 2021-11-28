import 'package:flutter/material.dart';
import 'package:flutterfactory/controller/video_notifier.dart';
import 'package:provider/provider.dart';

class VideoPage extends StatelessWidget {
  const VideoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple,
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'Videos: ${context.watch<VideoNotifier>().videoList.length}',
            style: TextStyle(color: Colors.white, fontSize: 48),
          ),
        ),
      ),
    );
  }
}

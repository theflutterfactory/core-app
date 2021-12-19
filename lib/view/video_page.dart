import 'package:flutter/material.dart';
import 'package:flutterfactory/controller/video_notifier.dart';
import 'package:flutterfactory/model/video.dart';
import 'package:provider/provider.dart';

class VideoPage extends StatelessWidget {
  const VideoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<VideoNotifier, List<Video>>(
      selector: (_, notifier) => notifier.videoList,
      builder: (_, videoList, __) {
        return Container(
          color: Colors.black87,
          child: ListView.builder(
            padding: EdgeInsets.all(16),
            itemCount: videoList.length,
            itemBuilder: (_, index) => Card(
              child: Container(
                padding: EdgeInsets.all(32),
                child: Text(
                  videoList[index].name,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

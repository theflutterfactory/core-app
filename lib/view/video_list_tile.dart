import 'package:flutter/material.dart';
import 'package:flutterfactory/model/video.dart';
import 'package:flutterfactory/view/video_player_screen.dart';

class VideoListTile extends StatelessWidget {
  final Video video;

  const VideoListTile(this.video, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(1),
      child: Column(
        children: [
          Image.network(video.thumbnail!),
          Container(
            color: Colors.black,
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => VideoPlayerScreen()),
                  ),
                  child: Text(
                    'View',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.star_border, color: Colors.blue),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

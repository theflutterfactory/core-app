import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerScreen extends StatefulWidget {
  VideoPlayerScreen({Key? key}) : super(key: key);

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  final GlobalKey _scaffoldKey = GlobalKey();
  late YoutubePlayerController _controller;

  String _playerStatus = '';

  bool _isPlayerReady = false;
  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;

  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: 'KkxRiXVrkB8',
      flags: YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: true,
        loop: false,
        hideControls: false,
        controlsVisibleAtStart: false,
        hideThumbnail: false,
        enableCaption: true,
      ),
    )..addListener(listener);
    _playerState = PlayerState.unknown;
    _videoMetaData = YoutubeMetaData();
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
    if (_isPlayerReady) {
      if (_controller.value.playerState == PlayerState.ended) {
        Navigator.pop(context);
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
        ]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Video')),
      body: YoutubePlayer(
        controller: _controller,
        aspectRatio: 16 / 9,
        showVideoProgressIndicator: false,
        controlsTimeOut: Duration(seconds: 2),
        progressIndicatorColor: Colors.red,
        actionsPadding: EdgeInsets.only(bottom: 50),
        topActions: [
          IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 20.0,
            ),
            onPressed: () {
              Navigator.pop(context);
              SystemChrome.setPreferredOrientations([
                DeviceOrientation.portraitUp,
              ]);
            },
          ),
        ],
      ),
    );
  }
}

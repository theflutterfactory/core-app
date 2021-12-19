import 'package:flutter/material.dart';
import 'package:flutterfactory/model/video.dart';
import 'package:flutterfactory/service/video_service.dart';

class VideoNotifier extends ChangeNotifier {
  List<Video> _videoList = [];
  List<Video> get videoList => _videoList;

  final VideoService _videoService = VideoService();

  Future<void> fetchVideos() async {
    _videoList = await _videoService.fetchVideos();
    notifyListeners();
  }
}

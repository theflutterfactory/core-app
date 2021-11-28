import 'package:flutter_factory/model/video.dart';

///A useful abstraction layer between services and data
class VideoRepository {
  Future<List<Video>> fetchAllVideos() async {
    await Future.delayed(Duration(seconds: 5));

    return [
      Video('Video 1', 'Desc 1'),
      Video('Video 2', 'Desc 2'),
      Video('Video 3', 'Desc 3'),
      Video('Video 4', 'Desc 4'),
      Video('Video 5', 'Desc 5'),
      Video('Video 6', 'Desc 6'),
    ];
  }
}
